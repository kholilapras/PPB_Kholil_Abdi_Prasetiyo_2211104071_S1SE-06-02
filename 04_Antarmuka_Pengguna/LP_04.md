<div align="center">

**LAPORAN PRAKTIKUM**  
**PEMROGRAMAN PERANGKAT BERGERAK**

**PERTEMUAN 4**  
**ANTARMUKA PENGGUNA**


<img src="https://github.com/user-attachments/assets/8ffbc3d9-1f18-4a72-8723-692ba5757f0c" alt="Logo_Telkom_University" width="25%">


**Disusun Oleh**:  
Kholil Abdi Prasetiyo / 2211104071  
SISE-06-02

**Asisten Praktikum**:  
Muhammad Faza Zulian  
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

## 1. Pengenalan Widget
Pada dasarnya semua tampilan di dalam Flutter adalah komponen yang
bernama Widget, dan akan dipecah menjadi komponen-komponen yang kecil
serta memiliki environment sendiri untuk mengelola dirinya. Masing-masing
widget memiliki state dan konfigurasinya sendiri, sehingga ketika state pada
widget berubah, widget akan membuat ulang dirinya agar selalu update dengan
perubahan yang terjadi.

Jenis-jenis Layout pada Flutter
1) Container  
Adalah widget dasar yang digunakan untuk menentukan batasan atau
constraints dari child widget-nya. Container dapat diisi dengan berbagai
jenis child widget seperti : text, image, atau bahkan layout widget lainnya.
2) Row dan Column  
Adalah layout widget yang digunakan untuk mengatur child widget secara
horizontal atau vertical.
3) Stack  
Adalah layout widget yang digunakan untuk menumpuk beberapa widget di
atau satu sama lain.
4) Expanded dan Flexible  
Adalah widget yang digunakan untuk mengatur bagaimana child widget
mengisi ruang yang tersedia. Expanded akan memberikan semua ruang
yang tersedia ke child widget, sedangkan Flexible akan memberikan
sejumlah ruang yang dapat berubahubah sesuai dengan kondisi yang ada.
5) ListView  
Adalah widget yang digunakan untuk menampilkan daftar item yang dapat
di-scroll.
6) GridView  
Adalah widget yang digunakan untuk menampilkan daftar item dalam
bentuk grid.
7) Wrap  
Adalah widget yang digunakan untuk menampilkan child widget dalam baris
atau kolom. Jika child widget melebihi lebar atau tinggi dari wrap, maka
widget tersebut akan dibungkus ke baris atau kolom berikutnya.
8) Table  
Adalah widget yang digunakan untuk menampilkan data dalam bentuk
tabel. TableRow untuk menambahkan baris, dan TableCell untuk
menambahkan kolom.


## 2. GridView
#### Source Code
```dart
import 'package:flutter/material.dart';

class GridViewApp extends StatefulWidget {
  const GridViewApp({super.key});

  @override
  State<GridViewApp> createState() => _GridViewAppState();
}

class _GridViewAppState extends State<GridViewApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Praktikum 4'),
        backgroundColor: Colors.blueAccent[700],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        padding: EdgeInsets.all(12),
        children: [
          Container(
            padding: EdgeInsets.all(12),
            child: Column(
              children: [
                Icon(Icons.add),
                Text('gridView ke1'),
              ],
            ),
            color: Colors.amberAccent,
          ),
          Container(
            padding: EdgeInsets.all(12),
            child: Row(
              children: [
                Icon(Icons.add),
                Text('gridView ke2'),
              ],
            ),
            color: const Color.fromARGB(255, 201, 238, 15),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text('gridView ke3'),
            color: const Color.fromARGB(255, 228, 9, 188),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text('gridView ke4'),
            color: const Color.fromARGB(255, 201, 64, 255),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text('gridView ke5'),
            color: const Color.fromARGB(255, 255, 64, 64),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text('gridView ke6'),
            color: const Color.fromARGB(255, 46, 66, 164),
          ),
        ],
      ),
    );
  }
}
```

#### Output
![Screenshot 2024-10-11 123048](https://github.com/user-attachments/assets/fa2a54f2-60b1-455f-8ca1-af063d60c8da)


#### Deskripsi
- Aplikasi Flutter di atas menggunakan StatefulWidget untuk membuat sebuah tampilan berbasis grid dengan enam Container sebagai item grid.
- GridView.count dipilih karena memungkinkan pengaturan jumlah kolom dengan parameter crossAxisCount yang diset ke 2.
- Jarak antar item diatur menggunakan mainAxisSpacing dan crossAxisSpacing dengan masing-masing bernilai 5.
- Setiap Container memiliki properti padding dan color yang diatur berbeda-beda, serta berisi widget seperti Icon, Text, atau kombinasi keduanya.
- Elemen-elemen tersebut diorganisasikan dalam Row atau Column untuk mengatur tata letak konten dalam setiap item grid.


## 3. ListView
#### Source Code
```dart
import 'package:flutter/material.dart';

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Latihan List View !!'),
          backgroundColor: Colors.amber,
        ),
        body: ListView(
          children: [
            Container(
              height: 200,
              width: 200,
              color: const Color.fromARGB(255, 93, 34, 29),
              child: Center(
                child: Text("Type AA"),
              ),
            ),
            Container(
              height: 200,
              width: 200,
              color: const Color.fromARGB(255, 28, 15, 207),
              child: Center(
                child: Text("Type BB"),
              ),
            ),
            Container(
              height: 200,
              width: 200,
              color: Colors.green,
              child: Center(
                child: Text("Type CC"),
              ),
            ),
            Container(
              height: 200,
              width: 200,
              color: Colors.blue,
              child: Center(
                child: Text("Type DD"),
              ),
            ),
          ],
        ));
  }
}
```

#### Output
![Screenshot 2024-10-11 123655](https://github.com/user-attachments/assets/20ab6c90-6991-4ab6-8208-bf3a19672c66)

#### Deskripsi
- Aplikasi Flutter menggunakan widget ListView untuk menampilkan daftar kontainer.
- Setiap kontainer memiliki ukuran tinggi dan lebar 200 piksel.
- Kontainer diisi dengan teks yang berada di tengah menggunakan widget Center.
- Terdapat empat kontainer dengan warna dan teks yang berbeda:  
  a. Kontainer pertama berwarna cokelat tua dengan teks "Type AA".  
  b. Kontainer kedua berwarna biru tua dengan teks "Type BB".  
  c. Kontainer ketiga berwarna hijau dengan teks "Type CC".  
  d. Kontainer keempat berwarna biru dengan teks "Type DD".  
- Semua kontainer ditampilkan secara vertikal dalam ListView.  


## 4. Stack
#### Source Code
```dart
import 'package:flutter/material.dart';

class StackScreen extends StatelessWidget {
  const StackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Latihan Stack !!!"),
        backgroundColor: const Color.fromARGB(255, 252, 2, 190),
      ),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                margin: EdgeInsets.all(5),
                height: 100,
                width: 100,
                color: Colors.blue,
              ),

              Container(
                margin: EdgeInsets.all(10),
                height: 100,
                width: 100,
                color: Colors.red,
              ),

              Container(
                margin: EdgeInsets.all(20),
                height: 100,
                width: 100,
                color: Colors.yellow,
              ),
            ],
          ),
          SizedBox(
            height: 35,
          ),
          Container(
            height: 270,
            width: 270,
            child: Stack(),
          )
        ],
      ),
    );
  }
}
```

#### Output
![image](https://github.com/user-attachments/assets/6ed31b3f-9b75-419c-b6f2-8a7100863a4a)


#### Deskripsi
- Program Flutter di atas membuat sebuah widget StackScreen yang ditampilkan dalam tampilan layar penuh menggunakan Scaffold.
- Pada bagian atas layar, terdapat AppBar dengan judul "Latihan Stack !!!" dan latar belakang berwarna pink. Di dalam body, terdapat dua widget utama, yaitu Stack dan Container.
- Pada Stack pertama, ada tiga Container yang ditumpuk dengan warna biru, merah, dan kuning.
- Container biru berada di paling bawah, merah di tengah, dan kuning di atas, dengan masing-masing memiliki margin yang berbeda sehingga menciptakan efek tumpukan yang terlihat dari setiap sisi. Selain itu, Stack ini disejajarkan di bagian kanan atas karena menggunakan properti alignment: Alignment.topRight.
- Di bawahnya, terdapat SizedBox untuk memberi jarak 35 piksel sebelum menampilkan Container kedua yang kosong dengan ukuran 270x270 piksel, yang siap diisi dengan elemen tambahan jika diperlukan.
- Program ini menampilkan penggunaan Stack yang fleksibel untuk menumpuk widget dalam satu area dengan pengaturan margin dan alignment.

---

# UNGUIDED

## Tugas Mandiri
Modifikasi project TP 04 (Tugas Pendahuluan) untuk Antarmuka Pengguna,
yang mana di dalamnya terdapat ListView, untuk merekomendasikan
beberapa tempat wisata yang ada di Banyumas disertai foto, nama wisata, dan
deskripsi singkat! (buatlah se kreatif mungkin).

#### Source Code
```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const AplikasiSaya());
}

class AplikasiSaya extends StatelessWidget {
  const AplikasiSaya({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rekomendasi Wisata',
      theme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.lightBlueAccent,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const BerandaJudul(judul: 'Rekomendasi Wisata Banyumas'),
    );
  }
}

class BerandaJudul extends StatelessWidget {
  const BerandaJudul({super.key, required this.judul});

  final String judul;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          judul,
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.black,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const SizedBox(height: 16),
            daftarTempatWisata(
              nama: 'Alun-alun Purwokerto',
              urlGambar:
                  'https://ik.imagekit.io/tvlk/blog/2023/03/Alun-Alun-Purwokerto-Wisata-Purwokerto-Traveloka-Xperience.jpg?tr=dpr-1.5,h-480,q-40,w-1024',
              deskripsi:
                  'Alun-alun Purwokerto adalah pusat aktivitas masyarakat dengan taman terbuka hijau yang indah. Dikelilingi oleh berbagai tempat kuliner dan pusat perbelanjaan, cocok untuk bersantai dan menikmati suasana kota.',
            ),
            daftarTempatWisata(
              nama: 'Menara Pandang Teratai',
              urlGambar:
                  'https://akcdn.detik.net.id/community/media/visual/2022/07/26/puan-maharani-pamer-foto-di-area-wisata-bung-karno.jpeg?w=700&q=90',
              deskripsi:
                  'Menara Pandang Teratai adalah menara ikonik di pusat Kota Purwokerto yang memberikan pemandangan indah Banyumas dari atas. Cocok untuk menikmati suasana senja dan malam hari.',
            ),
            const SizedBox(height: 16),
            daftarTempatWisata(
              nama: 'Baturraden',
              urlGambar:
                  'https://akcdn.detik.net.id/community/media/visual/2023/09/05/lokawisata-baturraden-1_43.jpeg?w=700&q=90',
              deskripsi:
                  'Baturraden adalah sebuah objek wisata alam yang terletak di lereng Gunung Slamet. Dikenal dengan pemandangan yang indah dan udara sejuk, tempat ini sangat cocok untuk wisata alam.',
            ),
          ],
        ),
      ),
    );
  }

  Widget daftarTempatWisata({
    required String nama,
    required String urlGambar,
    required String deskripsi,
  }) {
    return Card(
      color: Colors.grey[900],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 6,
      shadowColor: const Color.fromARGB(255, 74, 75, 75),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: Image.network(
              urlGambar,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 100,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nama,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlueAccent,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  deskripsi,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 16),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {},
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      child: Text(
                        'Kunjungi Sekarang',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
```

#### Output
![image](https://github.com/user-attachments/assets/0b686e9d-a28e-4098-8b31-c743ded97c0c)


#### Deskripsi
- Widget BerandaJudul menampilkan halaman dengan AppBar berjudul "Rekomendasi Wisata Banyumas" dan sebuah ListView.  
- Daftar tempat wisata ditampilkan menggunakan ListView dengan padding dan spasi antar elemen.  
- Setiap wisata ditampilkan dalam Card dengan gambar, judul, deskripsi, dan tombol aksi.  
- Gambar dengan Error Handling: Gambar tempat wisata ditampilkan dengan penanganan error menggunakan errorBuilder.  
- Setiap card memiliki tombol ElevatedButton dengan gaya khusus yang belum memiliki aksi.  
