<div align="center">

**LAPORAN PRAKTIKUM**  
**PEMROGRAMAN PERANGKAT BERGERAK**

**PERTEMUAN 13**  
**NETWORKING**


<img src="https://github.com/user-attachments/assets/8ffbc3d9-1f18-4a72-8723-692ba5757f0c" alt="Logo_Telkom_University" width="25%">


**Disusun Oleh**:  
Kholil Abdi Prasetiyo / 2211104071  
SISE-06-02

**Asisten Praktikum**:  
Muhammad Faza Zulian Gesit Al Barru  
Aisyah Hasna Aulia

**Dosen Pengampu**:  
Yudha Islami Sulistya, S.Kom., M.Cs

**PROGRAM STUDI S1 SOFTWARE ENGINEERING**  
**FAKULTAS INFORMATIKA**  
**TELKOM UNIVERSITY PURWOKERTO**  
**2024**
</div>

---
# GUIDED

## Networking / State Management
State management dalam Flutter adalah proses mengelola state atau status dari aplikasi, yaitu data atau informasi yang dapat berubah sepanjang siklus hidup aplikasi. State ini mencakup segala hal yang memengaruhi tampilan antarmuka pengguna (UI), seperti input pengguna, data dari API, dan status internal widget. Ketika aplikasi semakin kompleks dibuat, maka pasti akan ada saatnya dimana harus dibagikan state aplikasi ke berbagai halaman yang ada.

Flutter adalah deklaratif, sehingga Flutter membangun user interface berdasarkan state saat ini. Dengan menggunakan state management, dapat dilakukan sentralisasi semua state dari berbagai macam UI Control untuk mengendalikan aliran data lintas aplikasi.

State management penting karena aplikasi Flutter sering kali terdiri dari banyak widget yang saling terkait. Dengan mengelola state dengan baik, kita dapat memastikan :
• Sinkronisasi UI dan data, karena selalu mencerminkan data terkini.
• Organisasi kode yang baik untuk mempermudah pengembangan dan pemeliharaan.
• Pengurangan bug, karena state yang dikelola dengan benar mengurangi kemungkinan
terjadinya bug.

## App State (State Global)
State ini digunakan di berbagai widget dalam aplikasi. Contohnya adalah informasi pengguna yang masuk, data keranjang belanja, atau tema aplikasi. App state biasanya membutuhkan pendekatan state management yang lebih kompleks. Package/library pendukung Flutter memiliki berbagai framework atau package untuk state management, seperti :

A. Provider
Provider adalah library state management yang didukung resmi oleh tim Flutter. Provider memanfaatkan kemampuan bawaan Flutter seperti InheritedWidget, tetapi dengan cara yang lebih sederhana dan efisien.

B. BloC/Cubit
Bloc (Business Logic Component) adalah pendekatan state management berbasis pola stream. Bloc memisahkan business logic dari UI, sehingga cocok untuk aplikasi yang besar dan kompleks.

C. Riverpod
Riverpod adalah framework state management modern yang dirancang sebagai pengganti atau alternatif untuk Provider. Riverpod lebih fleksibel dan mengatasi beberapa keterbatasan Provider.

D. GetX
GetX adalah framework Flutter serbaguna yang menyediakan solusi lengkap untuk state management, routing, dan dependency injection. GetX dirancang untuk meminimalkan boilerplate code, meningkatkan efisiensi, dan mempermudah pengembangan aplikasi Flutter, terutama yang memerlukan reaktivitas tinggi.

## Praktikum

#### Menambahkan Package GetX  
![image](https://github.com/user-attachments/assets/fcb45c55-7c7f-41e9-b1e6-609541d8b478)  

#### Stuktur Folder  
![image](https://github.com/user-attachments/assets/43fe9682-3b82-412b-9d42-3b460132e3a1)  


#### Source Code
- lib/view/detail_page.dart
```dart
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Detail'),
      ),
      body: const Center(
        child: Text('Halaman Detail'),
      ),
    );
  }
}
```

- lib/view/my_home_page.dart
```dart
import 'package:flutter/material.dart';
import 'package:prak13ppb/view model/counter_controller.dart';
import 'package:get/get.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});

  final String title;
  final controller = Get.find<CounterController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
          child: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              controller.counter.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed('/detail');
                },
                child: Text('Go to Detail Page'))
          ],
        ),
      )),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: controller.incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: controller.decrementCounter,
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: controller.getsnackbar,
            tooltip: 'Snackbar',
            child: const Icon(Icons.chat),
          ),
          FloatingActionButton(
            onPressed: controller.getdialog,
            tooltip: 'Dialog',
            child: const Icon(Icons.notifications),
          ),
          FloatingActionButton(
            onPressed: controller.getbottomsheet,
            tooltip: 'Bottom Sheet',
            child: const Icon(Icons.arrow_upward),
          ),
        ],
      ),
    );
  }
}
```

- lib/view model/counter_controller.dart
```dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  var counter = 0.obs;

  void incrementCounter() {
    counter++;
  }

  void decrementCounter() {
    counter--;
  }

  void getsnackbar(){
    Get.snackbar(
      'GetX Snackbar',
      'Ini Snackbar', 
      colorText: Colors.white, 
      backgroundColor: Colors.green,
      );
  }

  void getdialog() {
    Get.defaultDialog(
      title: 'GetX Dialog',
      middleText: 'Ini dialog'
      );
  }

  void getbottomsheet(){
    Get.bottomSheet(Container(
      height: 70,
      width: double.infinity,
      color: Colors.amber,
      child: Text('Ini adalah Bottom Sheet'),
    )
    );
  }
}
```

- lib/main.dart
```dart
import 'package:flutter/material.dart';
import 'package:prak13ppb/view/detail_page.dart';
import 'package:prak13ppb/view/my_home_page.dart';
import 'package:prak13ppb/view model/counter_controller.dart';
import 'package:get/get.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(
          name:'/', 
          page: ()=> MyHomePage(title: 'Belajar GetX'),
        ),
        GetPage(
          name:'/detail', 
          page: ()=> DetailPage(),
        ),
      ],
    );
  }
}
```

#### Output
![Screenshot_2024-12-13-19-44-11-67_e0f37538806ce1ee9b624b1792cd5102](https://github.com/user-attachments/assets/8172416e-92e7-495c-a3c3-added660df97)

![Screenshot_2024-12-13-19-44-19-03_e0f37538806ce1ee9b624b1792cd5102](https://github.com/user-attachments/assets/ec8692f2-82d1-416c-be34-2b178a28f236)

![Screenshot_2024-12-13-19-44-24-12_e0f37538806ce1ee9b624b1792cd5102](https://github.com/user-attachments/assets/e75e4358-c4c0-4ba3-aad5-a8946362b4f8)

![Screenshot_2024-12-13-19-44-28-52_e0f37538806ce1ee9b624b1792cd5102](https://github.com/user-attachments/assets/43d1ea95-0e05-4d94-b924-aa173fd25697)

![Screenshot_2024-12-13-19-44-33-03_e0f37538806ce1ee9b624b1792cd5102](https://github.com/user-attachments/assets/7d31c498-767f-46de-ab90-49221b4ac845)

#### Deskripsi
- main.dart
  - Dependency Injection dilakukan dengan Get.put untuk menyediakan instance CounterController.
  - GetMaterialApp digunakan sebagai wrapper utama untuk routing dan navigasi.
  - initialRoute: Menentukan halaman awal.
  - getPages: Mendaftarkan rute ke halaman:
- counter_controller.dart
  - counter: Variabel observable untuk menghitung nilai counter.
  - incrementCounter: Menambah nilai counter.
  - decrementCounter: Mengurangi nilai counter.
  - getsnackbar: Menampilkan Snackbar dengan pesan.
  - getdialog: Menampilkan Dialog dengan judul dan isi.
  - getbottomsheet: Menampilkan Bottom Sheet dengan kontainer kuning.
- my_home_page.dart
  - Tombol Increment: Menambah nilai counter.
  - Tombol Decrement: Mengurangi nilai counter.
  - Tombol Snackbar: Menampilkan snackbar.
  - Tombol Dialog: Menampilkan dialog.
  - Tombol Bottom Sheet: Menampilkan bottom sheet.
  - Tombol Go to Detail Page: Navigasi ke halaman detail
- detail_page.dart
  - Halaman sederhana dengan teks "Halaman Detail".

# UNGUIDED

## Tugas Mandiri
Buatlah Aplikasi Catatan Sederhana menggunakan GetX, dengan ketentuan sebagai berikut :
1. Halaman utama atau Homepage untuk menampilkan daftar catatan yang telah ditambahkan. Setiap catatan terdiri dari judul dan deskripsi singkat, serta terdapat tombol untuk menghapus catatan dari daftar.
2. Halaman kedua untuk menambah catatan baru, berisi : form untuk memasukkan judul dan deskripsi catatan, serta tombol untuk menyimpan catatan ke daftar (Homepage).
3. Menggunakan getx controller.
4. Menggunakan getx routing untuk navigasi halaman.

#### Konfigurasi
Tambahkan Package GetX  
![image](https://github.com/user-attachments/assets/fcb45c55-7c7f-41e9-b1e6-609541d8b478)  

Struktur Folder  
![image](https://github.com/user-attachments/assets/f4113538-a2ab-48d0-994b-d935642f500b)  

#### Source Code
- lib/controllers/app_controller.dart
```dart
import 'package:get/get.dart';

class NoteController extends GetxController {
  var notes = <Map<String, String>>[].obs;

  void addNote(String title, String description) {
    notes.add({'title': title, 'description': description});
  }

  void deleteNoteAt(int index) {
    notes.removeAt(index);
  }
}
```

- lib/pages/add_note_page.dart
```dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/app_controller.dart';

class AddNotePage extends StatelessWidget {
  final NoteController noteController = Get.find();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Catatan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Judul'),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Deskripsi'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                noteController.addNote(
                  titleController.text,
                  descriptionController.text,
                );
                Get.back();
              },
              child: Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
```

- lib/pages/home_page.dart
```dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/app_controller.dart';
import 'add_note_page.dart';

class HomePage extends StatelessWidget {
  final NoteController noteController = Get.put(NoteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplikasi Catatan Sederhana'),
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: noteController.notes.length,
          itemBuilder: (context, index) {
            final note = noteController.notes[index];
            return ListTile(
              title: Text(note['title'] ?? ''),
              subtitle: Text(note['description'] ?? ''),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => noteController.deleteNoteAt(index),
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddNotePage());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
```

- lib/main.dart
```dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi Catatan Sederhana',
      home: HomePage(),
    );
  }
}
```

#### Output
![Screenshot_2024-12-13-20-33-38-63_f06621304c29da34a1366222fe63042a](https://github.com/user-attachments/assets/8e11d94a-b0fc-416f-b87b-774f72a1fb69)

![Screenshot_2024-12-13-20-34-13-71_f06621304c29da34a1366222fe63042a](https://github.com/user-attachments/assets/2debaa39-c532-49d4-9df3-e23717af83e7)

![Screenshot_2024-12-13-20-34-17-84_f06621304c29da34a1366222fe63042a](https://github.com/user-attachments/assets/18035e84-3ca8-43a9-9a15-2bbba44c9f33)

![Screenshot_2024-12-13-20-34-22-36_f06621304c29da34a1366222fe63042a](https://github.com/user-attachments/assets/b0239cf4-64c2-4dab-8523-58860645097b)

#### Deskripsi
- main.dart
  - HomePage sebagai halaman awal: Menyediakan tampilan daftar catatan.
- controllers/app_controller.dart
  - Tujuan file untuk mengelola logika dan data menggunakan GetX.
  - notes: Variabel reaktif (RxList) untuk menyimpan daftar catatan.
  - addNote: Menambahkan catatan baru ke daftar notes.
  - deleteNoteAt: Menghapus catatan berdasarkan indeks dari daftar notes.
- pages/home_page.dart
  - File untuk menampilkan daftar catatan yang telah ditambahkan.
  - Obx: Mengamati perubahan pada daftar catatan dan memperbarui tampilan secara real-time.
  - ListView.builder: Menampilkan daftar catatan secara dinamis.
  - ListTile: Menampilkan judul dan deskripsi catatan.
  - IconButton: Tombol hapus untuk menghapus catatan tertentu.
  - FloatingActionButton: Membuka halaman tambah catatan menggunakan Get.to.
- pages/add_note_page.dart
  - File untuk menambah catatan baru.
  - titleController: Input untuk judul catatan.
  - descriptionController: Input untuk deskripsi catatan.
  - Memanggil addNote dari NoteController untuk menyimpan catatan.
  - Menggunakan Get.back untuk kembali ke halaman utama.
- Fitur GetX yang digunakan
  - RxList agar perubahan data otomatis memperbarui tampilan.
  -  Controller dikelola secara global dengan Get.put() dan Get.find().
  -  Get.to: Navigasi ke halaman tambah catatan.
  -  Get.back: Kembali ke halaman utama.
  -  Obx: Memperbarui tampilan daftar catatan secara otomatis saat ada perubahan data.
