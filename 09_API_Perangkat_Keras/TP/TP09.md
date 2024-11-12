<div align="center">

**TUGAS PENDAHULUAN**  
**PEMROGRAMAN PERANGKAT BERGERAK**

**MODUL 9**  
**API PERANGKAT KERAS**

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
a) Buatlah satu project baru, yang mana di dalamnya memuat container berisi Icons.image_outlined, button camera, button gallery dan button hapus gambar. Button tidak harus berfungsi.

#### Source Code
main.dart
  ```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TP 9_2211104071',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: ImageSelectionScreen(),
    );
  }
}

class ImageSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Latihan Memilih Gambar'),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 400,
                height: 400,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.grey,
                    style: BorderStyle.solid,
                    width: 2,
                  ),
                ),
                child: Icon(
                  Icons.image_outlined,
                  size: 250,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.camera_alt_outlined),
                    label: Text("Camera"),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.blue,
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.image_outlined),
                    label: Text("Gallery"),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.green,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                child: Text("Hapus Gambar"),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.amber,
                  minimumSize: Size(200, 50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
  ```

#### Output  
![image](https://github.com/user-attachments/assets/a16c45b9-305b-4e7b-b4fa-646eb4df1b60)


#### Deskripsi
- Fungsi main(): Menjalankan aplikasi dengan MyApp sebagai root widget.
- Class MyApp: Mendefinisikan MaterialApp dengan tema Colors.amber dan halaman utama ImageSelectionScreen.
- Class ImageSelectionScreen: Menampilkan halaman dengan AppBar berjudul "Latihan Memilih Gambar". Container 400x400 berwarna abu-abu dengan ikon gambar sebagai placeholder.
- Tombol "Camera" dan "Gallery" untuk memilih gambar.
- Tombol "Hapus Gambar" untuk menghapus gambar (fungsi belum aktif).
