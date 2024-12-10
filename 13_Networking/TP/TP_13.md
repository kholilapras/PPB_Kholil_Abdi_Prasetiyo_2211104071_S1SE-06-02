<div align="center">

**TUGAS PENDAHULUAN**  
**PEMROGRAMAN PERANGKAT BERGERAK**

**MODUL 13**  
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
<div align="center">
  
**TUGAS PENDAHULUAN**  
  
</div>

## 1. Apa yang dimaksud dengan state management pada Flutter?
State management pada Flutter merujuk pada cara mengelola data (state) aplikasi dan bagaimana data tersebut berubah serta memengaruhi tampilan antarmuka pengguna (UI). State adalah informasi yang dapat berubah selama siklus hidup aplikasi, seperti data yang ditampilkan pada layar, status tombol, atau bahkan teks input pengguna.


## 2. Sebut dan jelaskan komponen-komponen yang ada di dalam GetX.
A. State Management
- Obx: Widget yang secara otomatis mendengarkan perubahan pada Rx (Reactive Variable). Saat nilai Rx berubah, Obx akan merender ulang UI yang relevan.
- GetxController: Kelas yang digunakan untuk mengelola logika dan state. Membantu memisahkan logika bisnis dari UI.
- Rx (Reactive Variable): Jenis data yang dapat didengarkan oleh UI. Setiap tipe data (seperti int, String, List, dll.) dapat dijadikan reaktif dengan menambahkan .obs.
B. Routing (Navigation)
- Get.to(): Navigasi ke halaman baru.
- Get.off(): Mengganti halaman saat ini dengan halaman baru (menghapus halaman sebelumnya dari stack).
- Get.offAll(): Menghapus semua halaman sebelumnya dan menavigasi ke halaman baru.
- Get.arguments: Digunakan untuk mengirim data antar halaman.
- Named Routes: Mendukung navigasi berbasis nama dengan GetMaterialApp.
C. Dependency Injection
- Get.put(): Menyediakan instansi yang langsung dapat digunakan di mana saja.
- Get.lazyPut(): Membuat instansi hanya ketika diperlukan (lazy initialization).
- Get.find(): Mengambil instansi yang sudah diinisialisasi dengan Get.put atau Get.lazyPut.
- Get.delete(): Menghapus instansi dari memori.
D. Snackbar, Dialog, dan BottomSheet
- Snackbar: Menampilkan pesan singkat di layar.
- Dialog: Menampilkan dialog di atas layar.
- BottomSheet: Menampilkan bottom sheet.
  
## 3. Lengkapilah code di bawah ini, dan tampilkan hasil outputnya serta jelaskan
```dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Controller untuk mengelola state counter
class CounterController extends GetxController {
  // TODO: Tambahkan variabel untuk menyimpan nilai counter
  // TODO: Buat fungsi untuk menambah nilai counter
  // TODO: Buat fungsi untuk mereset nilai counter
}

class HomePage extends StatelessWidget {
  final CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Counter App")),
      body: Center(
        child: Obx(() {
          // TODO: Lengkapi logika untuk menampilkan nilai counter
          return Text(
            "0", // Ganti ini dengan nilai counter
            style: TextStyle(fontSize: 48),
          );
        }),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              // TODO: Tambahkan logika untuk menambah nilai counter
            },
            child: Icon(Icons.add),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              // TODO: Tambahkan logika untuk mereset nilai counter
            },
            child: Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}
```

Jawab :

lib/main.dart
```dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CounterController extends GetxController {
  
  var counter = 0.obs;

  void increment() {
    counter++;
  }
  
  void reset() {
    counter.value = 0;
  }
}

class HomePage extends StatelessWidget {
  final CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Counter App")),
      body: Center(
        child: Obx(() {
          
          return Text(
            "${controller.counter}", 
            style: TextStyle(fontSize: 48),
          );
        }),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              
              controller.increment();
            },
            child: Icon(Icons.add),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              
              controller.reset();
            },
            child: Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}
```
#### Output
![Screenshot_2024-12-10-19-34-26-90_75d6ffaf204a98e02c904d1abb546c49](https://github.com/user-attachments/assets/8d39da83-716a-4906-b87c-ff1119962df6)


![Screenshot_2024-12-10-19-34-35-03_75d6ffaf204a98e02c904d1abb546c49](https://github.com/user-attachments/assets/4404970a-e429-42df-8e2e-e7257e64da62)


#### Deskripsi
Import Library:
- get/get.dart: Library GetX untuk manajemen state, routing, dan dependensi.

Controller (CounterController):
- Class ini merupakan controller yang menggunakan GetxController.
- Variabel counter: Variabel reaktif (obs) yang menyimpan nilai counter.
- Metode increment: Menambah nilai counter sebesar 1.
- Metode reset: Mengatur nilai counter kembali ke 0.

Halaman Utama (HomePage):
- Menggunakan Get.put() untuk menginstansiasi CounterController.
- Scaffold: Struktur utama halaman, termasuk:AppBar.
- Obx: Widget reaktif untuk memperbarui UI secara otomatis ketika nilai counter berubah.
- Tombol untuk menambah nilai (increment) dengan ikon "+".
- Tombol untuk mereset nilai (reset) dengan ikon refresh.
