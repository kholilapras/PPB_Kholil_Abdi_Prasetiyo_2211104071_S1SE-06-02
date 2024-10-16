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

#### Source Code
```dart
Comming Soon
```

#### Output
-

#### Deskripsi
-
