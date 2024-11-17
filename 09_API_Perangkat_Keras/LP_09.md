<div align="center">

**LAPORAN PRAKTIKUM**  
**PEMROGRAMAN PERANGKAT BERGERAK**

**PERTEMUAN 9**  
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
# GUIDED

## 1. Camera API
Camera API berfungsi untuk memungkinkan developer (pengembang) untuk mengakses dan mengontrol kamera perangkat. Flutter menyediakan paket camera yang memudahkan implementasi fitur kamera untuk mengambil foto, merekam video, dan mengakses umpan kamera secara langsung. Paket ini sangat berguna untuk membuat aplikasi yang membutuhkan pengambilan gambar atau video, seperti aplikasi media sosial atau e-commerce.

## 2. Media API
Media API adalah sekumpulan alat dan pustaka yang mendukung pengelolaan dan interaksi dengan berbagai jenis media, seperti gambar, video, dan audio. Flutter tidak memiliki API media bawaan untuk semua kebutuhan media, tetapi dapat menggunakan paket-paket tambahan untuk mengakses fitur media yang umum di aplikasi. 

## Praktikum

#### Konfigurasi
Izinkan akses kamera pada AndroidManifest.xml
![image](https://github.com/user-attachments/assets/03eddcf2-2e6e-4f4f-95e2-1fe0be3e588f)  

Ubah minimum versi Android sdk ke 21  
![image](https://github.com/user-attachments/assets/f97765a5-a10e-4f03-932b-c33aaeb67d6c)

Tambahkan Package Camera  
![image](https://github.com/user-attachments/assets/402f0a03-45bb-463f-94c1-01a35fb0542c)

#### lib/main.dart
```dart
import 'package:flutter/material.dart';
import 'package:guided9_ppb/camera_screen.dart';
import 'package:guided9_ppb/image_picker_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: ImageFromGalleryEx(ImageSourceType.gallery)
        // camera_screen()
        );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
```

#### lib/camera_screen.dart
```dart
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:guided9_ppb/display_screen.dart';

class camera_screen extends StatefulWidget {
  const camera_screen({super.key});

  @override
  State<camera_screen> createState() => _camera_screenState();
}

class _camera_screenState extends State<camera_screen> {
  late CameraController _controller;
  Future<void>? _initializeControllerFuture;

  Future<void>? _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    _controller = CameraController(firstCamera, ResolutionPreset.high);
    _initializeControllerFuture = _controller.initialize();
    setState(() {});
  }

  @override
  void initState() {
    _initializeCamera();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera Flutter'),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      body: FutureBuilder(
          future: _initializeControllerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return CameraPreview(_controller);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            await _initializeControllerFuture;
            final image = await _controller.takePicture();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => DisplayScreen(
                  imagePath: image.path,
                ),
              ),
            );
          } catch (e) {
            print(e);
          }
        },
        child: Icon(Icons.camera_alt),
      ),
    );
  }
}
```

#### lib/display_screen.dart
```dart
import 'dart:io';
import 'package:flutter/material.dart';

class DisplayScreen extends StatelessWidget {
  final String imagePath;

  const DisplayScreen({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Display Screen'),
        centerTitle: true,
        backgroundColor: Colors.greenAccent[600],
      ),
      body: Image.file(File(imagePath)),
    );
  }
}
```

#### lib/image_picker_screen.dart
```dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

enum ImageSourceType { camera, gallery }

class ImageFromGalleryEx extends StatefulWidget {
  final ImageSourceType type;

  ImageFromGalleryEx(this.type);

  @override
  ImageFromGalleryExState createState() => ImageFromGalleryExState(type);
}

class ImageFromGalleryExState extends State<ImageFromGalleryEx> {
  File? _image;
  late ImagePicker imagePicker;
  final ImageSourceType type;

  ImageFromGalleryExState(this.type);

  @override
  void initState() {
    super.initState();
    imagePicker = ImagePicker();
  }

  Future<void> _pickImage() async {
    var source = type == ImageSourceType.camera ? ImageSource.camera : ImageSource.gallery;
    XFile? image = await imagePicker.pickImage(
      source: source,
      imageQuality: 50,
      preferredCameraDevice: CameraDevice.front,
    );

    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          type == ImageSourceType.camera 
          ? "Image from Camera" 
          : "Image from Gallery",
        ),
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 52),
          Center(
            child: GestureDetector(
              onTap: _pickImage,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.red[200],
                ),
                child: _image != null
                    ? Image.file(
                        _image!,
                        width: 200.0,
                        height: 200.0,
                        fit: BoxFit.fitHeight,
                      )
                    : Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.red[200],
                        ),
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.grey[800],
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
```

#### Output
Camera Screen  
![Screenshot_2024-11-17-08-00-30-86_1d6bd734ceadca23b8a5f1c4ee3ea24d](https://github.com/user-attachments/assets/b8c5dbf6-ffc1-4f6d-a959-18e4e8d0c2ae)

![Screenshot_2024-11-17-08-00-46-46_1d6bd734ceadca23b8a5f1c4ee3ea24d](https://github.com/user-attachments/assets/b3426c23-a6df-40f0-bb42-60e9a8ac9875)

Image From Gallery  
![Screenshot_2024-11-17-08-01-28-96_1d6bd734ceadca23b8a5f1c4ee3ea24d](https://github.com/user-attachments/assets/63391f41-1aea-4fef-b44d-9388962b66c8)

![Screenshot_2024-11-17-08-02-08-21_da8e1b33c587c7c6dfcf439d19f6f0d3](https://github.com/user-attachments/assets/51fb51c9-0663-4c92-8075-4d2717b5b025)

![Screenshot_2024-11-17-08-02-14-66_1d6bd734ceadca23b8a5f1c4ee3ea24d](https://github.com/user-attachments/assets/85412b72-7264-4683-b72e-bf32b5a7c00d)

#### Deskripsi
- main.dart  
File ini berfungsi sebagai pintu masuk aplikasi Flutter.

- camera_screen.dart  
File ini mengatur tampilan kamera menggunakan package camera. class camera_screen adalah sebuah StatefulWidget yang memungkinkan pengguna mengambil foto menggunakan kamera perangkat. Dalam metode initState, kamera diinisialisasi dengan fungsi _initializeCamera, yang menggunakan kamera pertama yang tersedia di perangkat. Komponen UI utama adalah FutureBuilder yang menampilkan pratinjau kamera jika kamera berhasil diinisialisasi. Terdapat tombol melayang (FAB) untuk mengambil gambar, di mana gambar yang diambil akan disimpan dan ditampilkan di layar baru (DisplayScreen). Jika terjadi kesalahan selama proses pengambilan gambar, akan ditangkap melalui blok try-catch.

- display_screen.dart  
File ini berfungsi untuk menampilkan gambar yang diambil dari kamera. Kelas DisplayScreen adalah sebuah StatelessWidget yang menerima jalur gambar melalui parameter imagePath. Gambar yang diambil ditampilkan di tengah layar menggunakan widget Image.file. Menampilkan AppBar dengan teks "Display Screen".

- image_picker_screen.dart  
File ini memungkinkan pengguna memilih gambar dari galeri atau mengambil gambar dengan kamera, menggunakan image_picker. class ImageFromGalleryEx adalah sebuah StatefulWidget yang menerima parameter ImageSourceType untuk menentukan apakah pengguna memilih gambar dari galeri atau menggunakan kamera. Di dalam metode _pickImage, image_picker digunakan untuk membuka kamera atau galeri tergantung pada tipe sumber gambar. Jika pengguna memilih atau mengambil gambar, jalur file disimpan di dalam variabel _image, yang kemudian ditampilkan di layar dalam bentuk widget Image.file. Jika tidak ada gambar, ikon kamera ditampilkan sebagai pengganti.

# UNGUIDED

## Tugas Mandiri
1. Modifikasi project pemilihan gambar yang telah dikerjakan pada TugasPendahuluan Modul 09 agar fungsionalitas tombol dapat berfungsi untuk mengunggah gambar.
- Ketika tombol Gallery ditekan, aplikasi akan mengambil gambar dari galeri, dan setelah gambar dipilih, gambar tersebut akan ditampilkan di dalam container.
- Ketika tombol Camera ditekan, aplikasi akan mengambil gambar menggunakan kamera, dan setelah pengambilan gambar selesai, gambar tersebut akan ditampilkan di dalam container.
- Ketika tombol Hapus Gambar ditekan, gambar yang ada pada container akan dihapus.

#### Konfigurasi
Izinkan akses kamera pada AndroidManifest.xml
![image](https://github.com/user-attachments/assets/03eddcf2-2e6e-4f4f-95e2-1fe0be3e588f)  

Ubah minimum versi Android sdk ke 21  
![image](https://github.com/user-attachments/assets/f97765a5-a10e-4f03-932b-c33aaeb67d6c)

Tambahkan Package Camera dan Image Picker  
![image](https://github.com/user-attachments/assets/6d0f65ea-6a21-4cbe-9d40-4a473197dd22)

#### Source Code
lib/main.dart
```dart
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

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

class ImageSelectionScreen extends StatefulWidget {
  @override
  _ImageSelectionScreenState createState() => _ImageSelectionScreenState();
}

class _ImageSelectionScreenState extends State<ImageSelectionScreen> {
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImageFromGallery() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  Future<void> _pickImageFromCamera() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  void _clearImage() {
    setState(() {
      _imageFile = null;
    });
  }

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
                child: _imageFile != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.file(
                          _imageFile!,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Icon(
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
                    onPressed: _pickImageFromCamera,
                    icon: Icon(Icons.camera_alt_outlined),
                    label: Text("Camera"),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.blue,
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton.icon(
                    onPressed: _pickImageFromGallery,
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
                onPressed: _clearImage,
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
- Camera  
  ![Screenshot_2024-11-17-10-56-01-83_fa1458e74bdcc1bba02e487794c37064](https://github.com/user-attachments/assets/db95e090-38a0-4a56-9eb5-761aac28a29f)

- Gallery  
  ![Screenshot_2024-11-17-10-56-47-47_fa1458e74bdcc1bba02e487794c37064](https://github.com/user-attachments/assets/bc23169b-aede-476a-81eb-3195d6475a7c)

- Hapus  
  ![Screenshot_2024-11-17-10-56-53-22_fa1458e74bdcc1bba02e487794c37064](https://github.com/user-attachments/assets/df00309a-5e10-47f3-9a61-a12601100ae4)

#### Deskripsi
- Class ImageSelectionScreen: StatefulWidget yang memungkinkan aplikasi merender ulang UI berdasarkan perubahan gambar.
- State _ImageSelectionScreenState
  Variabel _imageFile: Menyimpan file gambar yang dipilih.
  ImagePicker _picker: Instance untuk mengakses galeri/kamera.
- Fungsi _pickImageFromGallery:
  Membuka galeri untuk memilih gambar.
  Gambar yang dipilih disimpan dalam variabel _imageFile dan ditampilkan di container.
- Fungsi _pickImageFromCamera:
  Membuka kamera untuk mengambil gambar.
  Gambar yang diambil disimpan dalam _imageFile dan ditampilkan.
- Fungsi _clearImage:
  Mengatur _imageFile ke null untuk menghapus gambar dari UI.
