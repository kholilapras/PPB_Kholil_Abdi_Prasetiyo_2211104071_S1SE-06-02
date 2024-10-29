<div align="center">

**TUGAS PENDAHULUAN**  
**PEMROGRAMAN PERANGKAT BERGERAK**

**MODUL 7**  
**NAVIGASI DAN NOTIFIKASI**

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
a) Buatlah satu project baru, yang mana di dalamnya terdapat navigasi untuk pindah dari satu halaman ke halaman lainnya

#### Source Code
- main.dart
  ```dart
  import 'pages/home.dart';
  
  void main() {
    runApp(const MyApp());
  }
  
  class MyApp extends StatelessWidget {
    const MyApp({super.key});
  
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepPurple, brightness: Brightness.dark),
          primaryColor: Colors.white,
          scaffoldBackgroundColor: Colors.blue,
        ),
        home: HomePage(),
      );
    }
  }
  ```
  
- pages/home.dart
  ```dart
  import 'package:flutter/material.dart';
  import 'menu.dart';
  import 'profile.dart';
  import 'settings.dart';
  
  class HomePage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Home', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.black, // AppBar background color
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildCardButton(
                context,
                icon: Icons.menu,
                label: 'Menu',
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MenuPage()),
                ),
              ),
              const SizedBox(height: 16),
              _buildCardButton(
                context,
                icon: Icons.person,
                label: 'Profile',
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                ),
              ),
              const SizedBox(height: 16),
              _buildCardButton(
                context,
                icon: Icons.settings,
                label: 'Settings',
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                ),
              ),
            ],
          ),
        ),
      );
    }
  
    Widget _buildCardButton(BuildContext context,
        {required IconData icon,
        required String label,
        required VoidCallback onPressed}) {
      return Card(
        color: Colors.grey[900],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
        child: ListTile(
          leading: Icon(icon, color: Colors.white),
          title: Text(label, style: const TextStyle(color: Colors.white)),
          trailing: const Icon(Icons.arrow_forward, color: Colors.white),
          onTap: onPressed,
        ),
      );
    }
  }
  ```

- pages/menu.dart
  ```dart
  import 'package:flutter/material.dart';
  
  class MenuPage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: const Text('Menu')),
        body: Center(
          child: const Text(
            'Menu Page !',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
      );
    }
  }
  ```

- pages/profile.dart
  ```dart
  import 'package:flutter/material.dart';
  
  class ProfilePage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: const Text('Profile')),
        body: Center(
          child: const Text(
            'Profile Page !',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
      );
    }
  }
  ```

- pages/settings.dart
  ```dart
  import 'package:flutter/material.dart';
  
  class SettingsPage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: const Text('Settings')),
        body: Center(
          child: const Text(
            'Settings Page !',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
      );
    }
  }
  ```


#### Output  
![image](https://github.com/user-attachments/assets/db353bb4-f757-4949-8f88-251f84d9b940)

![image](https://github.com/user-attachments/assets/0bc55e43-97f1-4f32-b13d-91aab6451698)

![image](https://github.com/user-attachments/assets/f33fc4be-cf8b-4cc4-b399-7a9b4025f188)

#### Deskripsi
- File main.dart digunakan untuk memulai aplikasi melalui fungsi main() dan menampilkan MyApp, widget utama yang mengatur tema dan halaman utama yaitu class HomePage.
- Di dalam class HomePage terdapat AppBar dengan judul "Home" dan beberapa tombol navigasi berbentuk card menggunakan fungsi _buildCardButton.
- Tombol-tombol navigasi mengarahkan pengguna ke tiga halaman berbeda, yaitu MenuPage, ProfilePage, dan SettingsPage.
- Masing-masing halaman tersebut memiliki struktur Scaffold dengan AppBar dan teks yang berbeda.
- Navigasi antar halaman dilakukan menggunakan Navigator.push dengan MaterialPageRoute, yang membawa pengguna ke halaman tujuan ketika tombol ditekan.
