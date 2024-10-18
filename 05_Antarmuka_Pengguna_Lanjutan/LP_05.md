<div align="center">

**LAPORAN PRAKTIKUM**  
**PEMROGRAMAN PERANGKAT BERGERAK**

**PERTEMUAN 5**  
**ANTARMUKA PENGGUNA LANJUTAN**


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

## 1. ListView.builder
Widget ListView jenis ini cocok digunakan ketika memiliki data list yang
lebih besar. ListView.builder membutuhkan itemBuilder dan itemCount.
Parameter itemBuilder merupakan fungsi yang mengembalikan widget untuk
ditampilkan. Sedangkan itemCount kita isi dengan jumlah seluruh item yang
ingin ditampilkan.


## 2. ListView.Separated
#### Source Code
```dart
import 'package:flutter/material.dart';

class JenisListView extends StatelessWidget {
  const JenisListView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>['A', 'B', 'C', 'D', 'E'];
    final List<int> colorCodes = <int>[600, 500, 400, 300, 200, 100];

    return Scaffold(
        appBar: AppBar(
          title: const Text('Jenis List View'),
          backgroundColor: const Color.fromARGB(255, 9, 236, 236),
        ),
        body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 50,
              color: Colors.blue[colorCodes[index]],
              child: Center(
                child: Text("Entry ${entries[index]}"),
              ),
            );
          },
          itemCount: entries.length,
          separatorBuilder: (BuildContext context, int index) {
            return Container(
              height: 10,
              color: const Color.fromARGB(255, 2, 14, 246),
            );
          },
        ));
  }
}
```

#### Output
![image](https://github.com/user-attachments/assets/378f2f40-bf30-4fc0-9b05-6ec2cbc9ce8d)


#### Deskripsi
Program di atas adalah sebuah aplikasi Flutter sederhana yang menggunakan widget ListView.separated untuk menampilkan daftar item dalam sebuah tampilan daftar (list view). Daftar ini berisi beberapa entriyang diwakili dalam daftar bernama entries. Warna latar belakang tiap item daftar diambil dari daftar colorCodes yang menentukan tingkat kecerahan warna biru untuk setiap item. Selain itu, setiap item daftar dipisahkan oleh sebuah pemisah berupa kontainer dengan tinggi 10 piksel dan warna biru tua. Aplikasi ini juga memiliki app bar dengan judul "Jenis List View" dan latar belakang berwarna biru cerah.


## 3. Flexible dan Expanded
#### Source Code
```dart
import 'package:flutter/material.dart';

class FlexibleExpandedScreen extends StatelessWidget {
  const FlexibleExpandedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flexible vs Expanded'),
        backgroundColor: const Color.fromARGB(188, 7, 48, 255),
      ),
      body: Column(
        children: [
          
          Text("Flexible"),
          SizedBox(
            height: 5,
          ),
          Row(
            children: <Widget>[
              Container(
                width: 50,
                height: 100,
                color: Colors.blue,
              ),
              Flexible(
                child: Container(
                  height: 100,
                  color: const Color.fromARGB(189, 8, 216, 244),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Flexible takes up the remaining space but can shrink if needed.",
                    ),
                  ),
                ),
              ),
              const Icon(Icons.sentiment_very_satisfied),
            ],
          ),
          const SizedBox(height: 20),
          
          Text("Expanded"),
          SizedBox(
            height: 5,
          ),
          Row(
            children: <Widget>[
              Container(
                width: 50,
                height: 100,
                color: const Color.fromARGB(255, 4, 193, 240),
              ),
              Expanded(
                child: Container(
                  height: 100,
                  color: const Color.fromARGB(199, 5, 127, 220),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Expanded forces the widget to take up all the remaining space.",
                    ),
                  ),
                ),
              ),
              const Icon(Icons.sentiment_very_satisfied),
            ],
          ),
        ],
      ),
    );
  }
}
```

#### Output
![image](https://github.com/user-attachments/assets/39324781-abc3-449b-99f1-1c81e516ee41)

#### Deskripsi
Program di atas menampilkan perbandingan antara widget Flexible dan Expanded di dalam sebuah layout berbentuk kolom (Column). Pada bagian pertama, ditampilkan judul "Flexible" dengan sebuah baris (Row) yang terdiri dari tiga elemen: sebuah kotak berwarna biru, widget Flexible yang berisi teks yang menjelaskan fungsi widget tersebut, dan sebuah ikon wajah tersenyum. Widget Flexible memungkinkan elemen di dalamnya untuk mengambil sisa ruang yang tersedia di baris, namun masih dapat menyusut jika diperlukan. Pada bagian kedua, ditampilkan judul "Expanded" dengan elemen serupa, namun widget yang digunakan adalah Expanded. Berbeda dengan Flexible, Expanded memaksa elemen di dalamnya untuk mengisi seluruh sisa ruang yang ada pada baris tersebut. Program ini memvisualisasikan perbedaan penggunaan kedua widget tersebut dalam mengatur tata letak ruang.

## 4. CustomScrollView
#### Source Code
```dart
import 'package:flutter/material.dart';

class Custom extends StatelessWidget {
  const Custom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 6, 151, 241),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('fufufafa'),
              centerTitle: true,
            ),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 4.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.blue[100 * (index % 9)],
                  child: Text('Grid Item $index'),
                );
              },
              childCount: 10,
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.blueGrey[100 * (index % 9)],
                  child: Text('List Item $index'),
                );
              },
              childCount: 8,
            ),
          ),
        ],
      ),
    );
  }
}
```

#### Output
![image](https://github.com/user-attachments/assets/a2815c6c-ed4d-4333-9440-b7f12b5f2e47)

#### Deskripsi
Program Flutter ini membuat sebuah tampilan antarmuka pengguna dengan menggunakan widget Scaffold yang memiliki AppBar dan CustomScrollView yang berisi beberapa jenis layout scrollable. Pada bagian atas, terdapat sebuah SliverAppBar yang bersifat pinned (tetap terlihat saat di-scroll) dengan judul "fufufafa" yang tampil saat bagian AppBar diperluas hingga 250 piksel. Di bawahnya, terdapat sebuah grid yang ditampilkan dalam layout SliverGrid dengan maksimal lebar setiap item grid adalah 200 piksel, berisi 10 item grid dengan latar belakang warna biru yang bervariasi. Selanjutnya, terdapat SliverFixedExtentList, yang menampilkan daftar item dengan tinggi tetap 50 piksel per item, berjumlah 8 item, di mana setiap item memiliki warna abu-abu kebiruan dengan nilai intensitas yang berbeda. Aplikasi ini menciptakan kombinasi antara grid dan daftar yang scrollable, serta mendukung tampilan dinamis dengan perubahan warna dan tata letak.

# UNGUIDED

## Tugas Mandiri
Modifikasi project Rekomendasi Wisata pada Tugas Unguided 04 modul Antarmuka Pengguna dengan mengimplementasikan widget CustomScrollView, SliverAppBar, dan SliverList untuk merekomendasikan beberapa tempat wisata yang ada di Banyumas disertai foto, nama wisata, dan deskripsi singkat! (buatlah se kreatif mungkin).

#### Source Code
```dart
import 'package:flutter/material.dart';
import 'dart:ui';

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

class BerandaJudul extends StatefulWidget {
  const BerandaJudul({super.key, required this.judul});

  final String judul;

  @override
  State<BerandaJudul> createState() => _BerandaJudulState();
}

class _BerandaJudulState extends State<BerandaJudul> {
  late ScrollController _scrollController;
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.offset > 150 && !_isScrolled) {
        setState(() {
          _isScrolled = true;
        });
      } else if (_scrollController.offset <= 150 && _isScrolled) {
        setState(() {
          _isScrolled = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            expandedHeight: 250.0,
            pinned: true,
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                double top = constraints.biggest.height;
                return FlexibleSpaceBar(
                  title: Text(
                    widget.judul,
                    style: TextStyle(
                      color: _isScrolled ? Colors.black : Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  centerTitle: true,
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(
                        'https://ik.imagekit.io/tvlk/blog/2023/03/Alun-Alun-Purwokerto-Wisata-Purwokerto-Traveloka-Xperience.jpg?tr=dpr-1.5,h-480,q-40,w-1024',
                        fit: BoxFit.cover,
                      ),
                      if (top > 100) ...[
                        Positioned.fill(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              color: Colors.black.withOpacity(0.3),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                );
              },
            ),
            backgroundColor: Colors.lightBlueAccent,
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
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
          ),
        ],
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
![image](https://github.com/user-attachments/assets/cbe216b6-6331-43c2-90fe-9a8b5cb23681)

![image](https://github.com/user-attachments/assets/7c37ec65-9d1b-43b1-bcdf-57556337e193)


#### Deskripsi
Program di atas yang menampilkan rekomendasi tempat wisata di Banyumas menggunakan beberapa widget penting, seperti CustomScrollView, SliverAppBar, dan SliverList. Aplikasi ini dimulai dengan widget MaterialApp, yang mengatur tema dan tata letak keseluruhan, kemudian dilanjutkan oleh widget BerandaJudul, yang berfungsi sebagai halaman utama.  

Di dalam halaman utama, CustomScrollView digunakan untuk membuat tampilan yang dapat digulir (scrollable) secara vertikal dengan berbagai elemen dinamis. Komponen utama di dalamnya adalah SliverAppBar, yang berfungsi sebagai bagian atas halaman (header) yang memiliki perilaku khusus saat digulir. SliverAppBar pada program ini memiliki tinggi yang dapat diperluas (expandedHeight), di mana gambar latar belakang serta judul "Rekomendasi Wisata Banyumas" ditampilkan. Saat pengguna menggulir ke bawah, SliverAppBar akan menyusut dan "pinned", yang berarti akan tetap berada di bagian atas halaman meskipun halaman terus digulir. Efek blur juga diterapkan pada gambar latar belakang ketika tingginya lebih dari 100 untuk memberikan efek transisi yang halus.  

Di bawah SliverAppBar, ada SliverList yang diisi oleh beberapa widget tempat wisata yang ditampilkan menggunakan metode daftarTempatWisata. SliverList ini memungkinkan elemen-elemen dalam daftar tempat wisata ditampilkan secara efisien dalam tampilan yang dapat digulir.
