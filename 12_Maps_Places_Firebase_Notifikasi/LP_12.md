<div align="center">

**LAPORAN PRAKTIKUM**  
**PEMROGRAMAN PERANGKAT BERGERAK**

**PERTEMUAN 12**  
**MAPS PLACES FIREBASE NOTIFIKASI**


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

## Google Maps API
Google Maps API merupakan salah satu layanan dari Google untuk membantu developer menciptakan aplikasi yang menggunakan fitur peta atau maps. Pada Google Maps API kita dapat memasang marker, menggunakan fitur route, mencari tempat, dan masih banyak lagi. Cara implementasi Google API pada flutter dapat dilakukan dengan menggunakan packages Google Maps. Tahapan dalam menambahkan Google Maps API dapat mengikuti langkah-langkah berikut :
1. Dapatkan API key melalui link berikut https://cloud.google.com/maps-platform/
2. Selanjutnya, enable Google Map SDK di tiap platform yang akan menggunakan Google
Maps.  
a. Pergi ke https://console.cloud.google.com/ (Google Delevopers Console)  
b. Pilih project yang ingin menggunakan Google Maps  
c. Pilih pada navigation menu, lalu pilih “Google Maps”  
d. Pilih “APIs” di bawah menu Google Maps  
e. Untuk mengaktifkan Google Maps di Android, pilih “Maps SDK for Android” pada  
section “Additional APIs”, lalu pilih “ENABLE”  
f. Untuk mengaktifkan Google Maps di iOS, pilih “Maps SDK for iOS” pada section  
“Additional APIs”, lalu pilih “ENABLE”  
g. Pastikan bahwa APIs telah aktif pada section “Enabled APIs”  
h. Untuk lebih detail bisa cek di https://developers.google.com/maps/gmp-get-started  

## Praktikum

#### Cara Mendapatkan API Google Maps secara cepat
salin dan buka link url berikut ini:
```
https://console.developers.google.com/flows/enableapi?apiid=maps-android-backend.googleapis.com&keyType=CLIENT_SIDE_ANDROID
```

#### Set minSdkVersion
![image](https://github.com/user-attachments/assets/f76f48ae-0bd7-4f50-bcf7-c2b0c0ec93a5)

#### Tambahkan API key pada manifest aplikasi
![image](https://github.com/user-attachments/assets/e262a565-1caf-4a86-b959-3e01ec146e5a)

#### Menambah Packages Google Maps
![image](https://github.com/user-attachments/assets/1791077c-30da-4b9a-b287-4cfaa919aa07)

#### Source Code
- homepage.dart
```dart
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static final LatLng _kMapCenter = LatLng(-7.4352631, 109.2465177);
  static final CameraPosition _kInitialPosition = CameraPosition(
    target: _kMapCenter,
    zoom: 12.0,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps Demo'),
      ),
      body: GoogleMap(
        initialCameraPosition: _kInitialPosition,
        myLocationEnabled: true,
      ),
    );
  }
}
```
  
- main.dart
```dart
import 'package:flutter/material.dart';
import 'package:guided12_ppb/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}
```

#### Output
![Screenshot_2024-12-07-08-17-16-27_bda442a1e0734a481d1777b6657dcc1d](https://github.com/user-attachments/assets/734ef7b5-73fd-46ef-bfa6-1dc0326020ad)


#### Deskripsi
- class MyHomePage adalah widget utama dari aplikasi ini yang menggunakan stateful widget.
State Management:
- _MyHomePageState adalah kelas yang mengelola status dari MyHomePage. Kelas ini mengatur logika dan data yang digunakan di dalam widget.
- LatLng (kMapCenter): Mendefinisikan lokasi pusat peta dengan koordinat geografis: latitude -7.4352631 dan longitude 109.2465177.
- CameraPosition (kInitialPosition): Menentukan posisi awal kamera peta, termasuk lokasi target (kMapCenter) dan tingkat zoom 12.0.
- initialCameraPosition: Menentukan posisi kamera awal menggunakan _kInitialPosition.
- myLocationEnabled: Mengaktifkan fitur yang memungkinkan pengguna melihat lokasi mereka di peta.

# UNGUIDED

## Tugas Mandiri
Dari tugas guided yang telah dikerjakan, lanjutkan hingga ke bagian place picker untuk
memberikan informasi mengenai lokasi yang ditunjuk di peta.

#### Konfigurasi
note : package geocoding yang lebih mudah diimplementasikan dibanding package place_picker_google untuk place picker
![image](https://github.com/user-attachments/assets/23955776-c60c-493d-95aa-bd79feff8d8b)

#### Source Code
lib/main.dart
```dart
import 'package:flutter/material.dart';
import 'package:guided12_ppb/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}
```

lib/homepage.dart
```dart
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static final LatLng _initialPosition = LatLng(-7.4352631, 109.2465177);
  CameraPosition _kInitialPosition =
      CameraPosition(target: _initialPosition, zoom: 12.0);

  LatLng? _selectedLocation;
  String? _address;

  final Set<Marker> _markers = {};

  Future<void> _getAddress(LatLng position) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        setState(() {
          _address =
              "${place.street}, ${place.locality}, ${place.administrativeArea}, ${place.country}";
        });
      }
    } catch (e) {
      print(e);
      setState(() {
        _address = "Address not found";
      });
    }
  }

  void _onMapTap(LatLng position) {
    setState(() {
      _selectedLocation = position;
      _markers.clear();
      _markers.add(
        Marker(
          markerId: MarkerId(position.toString()),
          position: position,
        ),
      );
    });
    _getAddress(position);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps Demo'),
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: _kInitialPosition,
            myLocationEnabled: true,
            markers: _markers,
            onTap: _onMapTap,
          ),
          if (_selectedLocation != null)
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.all(16.0),
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _address ?? "Fetching address...",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        // Konfirmasi lokasi
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Location Confirmed"),
                            content: Text("Location: $_address"),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text("OK"),
                              ),
                            ],
                          ),
                        );
                      },
                      child: Text("Confirm Location"),
                    ),
                  ],
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
![Screenshot_2024-12-10-19-02-14-06_bda442a1e0734a481d1777b6657dcc1d](https://github.com/user-attachments/assets/996dcd2a-1abb-421a-b0a9-700fa39a16a2)


#### Deskripsi
Komponen Utama:
- GoogleMap: Untuk menampilkan peta dan menangani interaksi pengguna.
- Marker: Menandai lokasi yang dipilih oleh pengguna.
- _getAddress: Fungsi untuk mengambil alamat dari koordinat menggunakan geocoding.
- _onMapTap: Callback untuk menangkap lokasi yang dipilih oleh pengguna dan menambahkan marker.

Penggunaan State:
- Set<Marker> untuk menyimpan marker di peta.
- LatLng? _selectedLocation untuk lokasi yang dipilih.
- String? _address untuk alamat lokasi yang diambil.
