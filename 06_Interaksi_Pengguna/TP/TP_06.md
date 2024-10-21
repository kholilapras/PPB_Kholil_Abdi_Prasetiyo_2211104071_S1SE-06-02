<div align="center">

**TUGAS PENDAHULUAN**  
**PEMROGRAMAN PERANGKAT BERGERAK**

**MODUL 6**  
**INTERAKSI PENGGUNA**

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


## A. SOAL NOMOR 1
a) Pada tugas pendahuluan ini, buat project Flutter baru  
b) Implementasi Bottom Navigation Bar:  
- Tambahkan BottomNavigationBar pada halaman aplikasi.
- BottomNavigationBar memiliki 3 item menu dengan label: "Home", "Wisata",
dan "Profil".
- Setiap kali memilih salah satu menu di BottomNavigationBar, halaman yang
ditampilkan berubah sesuai menu yang dipilih.
- Home: Menampilkan teks "Ini adalah halaman Home".
- Wisata: Menampilkan teks "Ini adalah halaman Wisata".
- Profile: Menampilkan teks "Ini adalah halaman Profil".

c.) Referensi  
- Website : https://api.flutter.dev/flutter/material/BottomNavigationBar-class.html  
- Youtube : https://www.youtube.com/watch?v=xKeyCJgK_MM  


**Contoh Output :** 
![image](https://github.com/user-attachments/assets/f94db7d4-7dc6-47ee-808c-df365194819c)



#### Source Code
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
      title: 'tp6_interaksipengguna',
      theme: ThemeData(
        primaryColor: Colors.black,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.black,
          secondary: Colors.amber,
        ),
      ),
      home: const HalamanUtama(),
    );
  }
}

class HalamanUtama extends StatefulWidget {
  const HalamanUtama({super.key});

  @override
  _HalamanUtamaState createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  int _indeksDipilih = 0;

  static const List<Widget> _halaman = <Widget>[
    Center(child: Text('Ini halaman Beranda', style: TextStyle(fontSize: 24))),
    Center(child: Text('Ini halaman Wisata', style: TextStyle(fontSize: 24))),
    Center(child: Text('Ini halaman Profil', style: TextStyle(fontSize: 24))),
  ];

  void _pilihItem(int indeks) {
    setState(() {
      _indeksDipilih = indeks;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latihan BottomNavigationBar'),
        backgroundColor: Colors.amber,
      ),
      body: _halaman[_indeksDipilih],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Wisata',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: _indeksDipilih,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.grey,
        onTap: _pilihItem,
      ),
    );
  }
}
```


#### Output  
![image](https://github.com/user-attachments/assets/c8e507ec-7467-42fd-a215-7a3c06457f30)

#### Deskripsi
- Fungsi main() : Untuk menjalankan aplikasi Flutter dengan widget MyApp.  
- class HalamanUtama: Merupakan widget tipe StatefulWidget, memungkinkan untuk menyimpan dan mengubah kondisi (state) dari widget saat berjalan. Mengimplementasikan halaman utama dengan tiga tampilan halaman berbeda.  
- class _HalamanUtamaState: Menyimpan dan mengubah kondisi aplikasi melalui variabel _indeksDipilih, yang merepresentasikan halaman mana yang sedang dipilih.  
- Fungsi _pilihItem() mengubah nilai dari _indeksDipilih untuk menentukan halaman yang akan ditampilkan.  
- onTap menggunakan metode _pilihItem() untuk memperbarui halaman yang ditampilkan berdasarkan indeks item yang dipilih.  
