<div align="center">

**TUGAS PENDAHULUAN**  
**PEMROGRAMAN PERANGKAT BERGERAK**

**MODUL 4**  
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
<div align="center">
  
  **TUGAS PENDAHULUAN**  
  
</div>


## A. SOAL NOMOR 1
Buatlah tampilan aplikasi sederhana dalam flutter yang menampilkan deskripsi
rekomendasi tempat wisata dengan mengimplementasikan widget dasar
Detail Tugas:
- AppBar: Buatlah sebuah AppBar dengan judul "Rekomendasi Wisata".
- Text: Di tengah layar, tambahkan widget Text dengan pesan "Nama Tempat
Wisata".
- Image: Tambahkan gambar dari internet di bawah teks tersebut menggunakan
widget Image.network.
- Text: Dibawah gambar, tambahkan deskripsi dari tempat wisata
- Button: Tambahkan tombol di bawah gambar dengan label "Kunjungi Tempat".

**Contoh Output :**  
![image](https://github.com/user-attachments/assets/5b8fe0d0-ad02-429f-84d1-bb4a4a7b3a34)

#### Source Code
- main.dart
```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rekomendasi Wisata',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Rekomendasi Wisata'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Baturaden',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Image.network(
              'https://akcdn.detik.net.id/community/media/visual/2023/09/05/lokawisata-baturraden-1_43.jpeg?w=700&q=90',
              height: 200,
              width: 300,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Baturaden adalah sebuah objek wisata alam yang terletak di lereng Gunung Slamet, '
                'sekitar 15 kilometer dari pusat kota Purwokerto, Kabupaten Banyumas, Jawa Tengah. '
                'Terkenal dengan pemandangan alamnya yang indah dan udara yang sejuk, Baturaden menjadi '
                'destinasi favorit wisatawan lokal maupun mancanegara.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
              },
              child: const Text('Kunjungi Sekarang'),
            ),
          ],
        ),
      ),
    );
  }
}
```
#### Output
![image](https://github.com/user-attachments/assets/d3300b54-ba27-4afa-86e5-b21f143231c9)

#### Deskripsi
- Fungsi main() berfungsi untuk menjalankan aplikasi Flutter dengan memanggil runApp(), yang memuat widget utama MyApp.

- MyApp class adalah StatelessWidget yang berfungsi sebagai root dari aplikasi ini.

- MyHomePage class merupakan StatelessWidget yang berfungsi sebagai halaman utama aplikasi. Atribut title dengan judul "Rekomendasi Wisata". Widget Scaffold digunakan untuk menstrukturkan halaman, di mana terdapat AppBar (header) dan body yang memuat konten utama.

- AppBar menampilkan judul halaman di tengah, dengan latar belakang warna sesuai tema aplikasi.

- Konten Halaman Utama (body):  
a. Nama Wisata: Teks "Baturaden" dengan ukuran font besar dan tebal.  
b. Gambar: Gambar dari URL online, ditampilkan menggunakan Image.network.  
c. Deskripsi: Penjelasan tentang lokasi wisata Baturaden.  
d. Tombol: Tombol "Kunjungi Sekarang" yang belum memiliki aksi apa pun karena onPressed tidak diimplementasikan.  
