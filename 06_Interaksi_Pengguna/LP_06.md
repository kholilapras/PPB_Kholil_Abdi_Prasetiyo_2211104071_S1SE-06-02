<div align="center">

**LAPORAN PRAKTIKUM**  
**PEMROGRAMAN PERANGKAT BERGERAK**

**PERTEMUAN 6**  
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
# GUIDED

## 1. Packages
Dart package terdapat pada direktori yang didalamnya terdapat file pubspec.yaml. Contoh penggunaan packages adalah membuat request ke server menggunakan protokol http. Custom navigation/route handling menggunakan fluro, dsb.

i.) Buka web pub.dev, lalu cari packages yang di butuhkan misal google fonts, lalu klik icon copy disebelah teks nama packages  
![image](https://github.com/user-attachments/assets/ef880a21-8d27-4ccf-aeaa-a0ad9bbf34fd)  

ii.) Setelah berhasil disalin, cari dan buka file pubspec.yaml pada project flutter  
![image](https://github.com/user-attachments/assets/0bba704e-3fde-432d-94e9-934e5f885d12)  

ii. Paste teks yang telah disalin pada posisi seperti dibawah ini  
![image](https://github.com/user-attachments/assets/6fd9139a-19b7-4172-a7bf-ce8bf1bfd8f3)  





## 2. User Interaction
## 2.1 Stateful & Stateless
Widget stateless tidak pernah berubah. Ikon, IconButton, dan Teks adalah contoh widget stateless. Sub kelas widget stateless StatelessWidget. Widget stateful bersifat dinamis misalnya, ia dapat mengubah tampilannya sebagai respons terhadap peristiwa yang dipicu oleh interaksi pengguna atau saat menerima data.

## 2.2 Form
Form adalah kumpulan widget yang digunakan untuk mengumpulkan input dari pengguna. Biasanya, form ini terdiri dari beberapa field seperti TextFormField, Checkbox, Radio, dan lain-lain

## 2.3 Menu
Menu berfungsi untuk separasi antar fitur atau page. Secara umum terdapat 2 jenis widget menu yang sering digunakan, yaitu "bottom navigation bar" dan "tab bar".

## 2.4 Buttons  
- ElevatedButton : tombol yang biasa kita gunakan saat kita mendaftar, submit, login, dst. Widget ini digunakan untuk membuat tombol dengan tampilan yang lebih menonjol, biasanya dengan efek bayangan yang memberikan kesan kedalaman.  
- TextButton : widget yang digunakan untuk membuat tombol yang
menampilkan teks.
- DropdownButton : widget yang memungkinkan untuk memilih satu nilai dari serangkaian pilihan yang disediakan dalam bentuk menu dropdown. Ini sangat berguna untuk situasi di mana Anda ingin membatasi pilihan pengguna ke beberapa opsi yang sudah ditentukan


## main.dart
#### Source Code
```dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prak6/my_navbar.dart';
import 'package:prak6/my_package.dart';
import 'package:prak6/my_tabbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '2211104071',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: myPackage(),
      //myTabbar(),
      //myNavbar(),
    );
  }
}
```

## my_package.dart
#### Source Code
```dart
import 'package:flutter/material.dart';

class myPackage extends StatefulWidget {
  const myPackage({super.key});

  @override
  State<myPackage> createState() => _myPackageState();
}

class _myPackageState extends State<myPackage> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Praktikum 6"),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              obscureText: false,
              obscuringCharacter: '*',
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                hintText: 'Masukkan Username',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              obscureText: true,
              obscuringCharacter: '*',
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                hintText: 'Masukkan Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'This is Elevated Button',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 15),
            TextButton(
              onPressed: () {},
              child: Text(
                'Ini adalah Text Button',
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: 15),
            DropdownButton<String>(
              value: selectedValue,
              isExpanded: true,
              hint: Text('Silahkan Pilih Opsi'),
              items: <String>['AAA', 'BBB', 'CCC']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newvalue) {
                setState(() {
                  selectedValue = newvalue;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
```
#### Output
![image](https://github.com/user-attachments/assets/4117c50f-fe18-4d8f-a9b2-96063f35fbbd)


## my_tabbar.dart
#### Source Code
```dart
import 'package:flutter/material.dart';

class myTabbar extends StatelessWidget {
  const myTabbar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Menu Tab Bar"),
            bottom: const TabBar(tabs: [
              Tab(
                icon: Icon(Icons.food_bank),
                text: "Menu",
              ),
              Tab(
                icon: Icon(Icons.calendar_month),
                text: "Calendar",
              ),
              Tab(
                icon: Icon(Icons.history),
                text: "History",
              ),
            ]),
            backgroundColor: Colors.amber,
          ),
          body: const TabBarView(children: [
            Center(
              child: Text("Ini Konten Menu"),
            ),
            Center(
              child: Text("Ini Konten Calendar"),
            ),
            Center(
              child: Text("Ini Konten History"),
            ),
          ])),
    );
  }
}
```
#### Output
![image](https://github.com/user-attachments/assets/6c95319f-d58b-4387-9b74-5e5bd88d9089)


## my_navbar.dart
#### Source Code
```dart
import 'package:flutter/material.dart';
import 'package:prak6/my_package.dart';
import 'package:prak6/my_tabbar.dart';

class myNavbar extends StatefulWidget {
  const myNavbar({super.key});

  @override
  State<myNavbar> createState() => _myNavbarState();
}

class _myNavbarState extends State<myNavbar> {
  int _selectedIndex = 0;

  void _onTappedItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> _pages = <Widget>[
    myTabbar(),
    myPackage(),
    myPackage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Button Navigation Bar"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Menu 1'),
          BottomNavigationBarItem(icon: Icon(Icons.person_2), label: 'Menu 2'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_2_sharp), label: 'Menu 3'),
        ],
        selectedItemColor: Colors.amber,
        currentIndex: _selectedIndex,
        onTap: _onTappedItem,
      ),
    );
  }
}
```
#### Output
![image](https://github.com/user-attachments/assets/ac943dfe-087d-47c0-a531-1b35574f0573)



# UNGUIDED

## Tugas Mandiri
Modifikasi project TP 06 (Tugas Pendahuluan) Interaksi Pengguna, dengan mengimplementasikan penggunaan form dan button.  

## Contoh Output
![image](https://github.com/user-attachments/assets/46eee340-9c19-4847-8f12-0621e6fbb62b)


#### Source Code
```dart
Comming Soon
```

#### Output


#### Deskripsi
