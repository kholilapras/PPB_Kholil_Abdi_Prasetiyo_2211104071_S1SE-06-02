<div align="center">

**TUGAS PENDAHULUAN**  
**PEMROGRAMAN PERANGKAT BERGERAK**

**MODUL 12**  
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
<div align="center">
  
**TUGAS PENDAHULUAN**  
  
</div>

## 1. Menambahkan Google Maps Package
A. Apa nama package yang digunakan untuk mengintegrasikan Google Maps di
Flutter dan sebutkan langkah-langkah yang diperlukan untuk menambahkan
package Google Maps ke dalam proyek Flutter.  
i. Buka website pub.dev lalu cari google_maps_flutter lalu klik icon copy  

ii. Tambahkan package tersebut ke file pubspec.yaml di project flutter  
![image](https://github.com/user-attachments/assets/b7fb5a1b-67d7-49b3-8208-b2e8b34964f2)  

iii. Jalankan perintah flutter pub get di terminal  

iv. Konfigurasi API Key: Dapatkan API Key dari Google Cloud Console. Aktifkan API Maps SDK for Android  

v. Buka file android/app/src/main/AndroidManifest.xml. Tambahkan API Key ke dalam elemen <application>:
```dart
<meta-data
    android:name="com.google.android.geo.API_KEY"
    android:value="YOUR_API_KEY" />
```
vi. Di file Dart, impor library
```dart
import 'package:google_maps_flutter/google_maps_flutter.dart';
```
vii. Tambahkan widget Google Maps dalam Scaffold atau widget lainnya:
```dart
GoogleMap(
  initialCameraPosition: CameraPosition(
    target: LatLng(37.7749, -122.4194),
    zoom: 12.0,
  ),
)
```

B. Mengapa kita perlu menambahkan API Key, dan di mana API Key tersebut diatur
dalam aplikasi Flutter?
- Mengapa API Key Diperlukan?
  - Autentikasi: API Key memastikan bahwa hanya aplikasi yang memiliki izin dapat menggunakan layanan Google Maps.
  - Quota Management: Google Cloud menggunakan API Key untuk memantau penggunaan dan membatasi jumlah permintaan berdasarkan paket yang dipilih.
  - Keamanan: API Key membantu Google memastikan bahwa hanya aplikasi yang valid dapat mengakses API.  
- Di Mana API Key Diatur dalam Aplikasi Flutter?
  - Android: API Key diatur di file AndroidManifest.xml di bawah tag <application>.
  - iOS: API Key didefinisikan di file AppDelegate.swift menggunakan GMSServices.provideAPIKey("YOUR_API_KEY").

## 2. Menampilkan Google Maps
A. Tuliskan kode untuk menampilkan Google Map di Flutter menggunakan widget
GoogleMap.
```dart
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MapScreen(),
    );
  }
}

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  // Posisi awal kamera
  static const CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(-6.200000, 106.816666),
    zoom: 12,
  );

  // Controller untuk Google Map
  late GoogleMapController _mapController;

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Google Maps Example"),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: _initialCameraPosition,
      ),
    );
  }
}
```

B. Bagaimana cara menentukan posisi awal kamera (camera position) pada GoogleMaps di Flutter?  
Untuk menentukan posisi awal kamera di Google Maps, menggunakan properti initialCameraPosition dari widget GoogleMap. Properti ini memerlukan nilai CameraPosition, yang berisi:  
i. target: Lokasi geografis awal dalam format LatLng(latitude, longitude).  
ii. zoom: Tingkat zoom kamera.  
iii. (Opsional) bearing: Rotasi kamera dalam derajat.  
iv. (Opsional) tilt: Sudut miring kamera dalam derajat.  
contoh :  
```dart
CameraPosition initialCameraPosition = CameraPosition(
  target: LatLng(-6.200000, 106.816666),
  zoom: 12,
);
```

C. Sebutkan properti utama dari widget GoogleMap dan fungsinya.
- initialCameraPosition : Menentukan posisi awal kamera saat peta pertama kali dimuat.
- onMapCreated : Callback yang dipanggil saat peta berhasil dibuat.
- mapType : Menentukan jenis tampilan peta (normal, satelit, terrain, dll.).
- markers : Menampilkan penanda (marker) pada peta.
- polylines : Menampilkan garis polyline di peta.
- zoomControlsEnabled : Mengaktifkan atau menonaktifkan tombol kontrol zoom.
- myLocationEnabled : Menampilkan titik lokasi pengguna saat ini di peta.
- onCameraMove : Callback yang dipanggil saat kamera bergerak.
- gestureRecognizers : Menentukan gestur pengguna yang diizinkan pada peta.

## 3. Menambahkan Marker
A. Tuliskan kode untuk menambahkan marker di posisi tertentu (latitude: -6.2088,
longitude: 106.8456) pada Google Maps.
```dart
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MapScreen(),
    );
  }
}

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final LatLng _initialPosition = LatLng(-6.2088, 106.8456); // Jakarta coordinates
  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _addMarker();
  }

  void _addMarker() {
    _markers.add(
      Marker(
        markerId: MarkerId("jakarta_marker"),
        position: _initialPosition,
        infoWindow: InfoWindow(
          title: "Jakarta",
          snippet: "Ibu Kota Indonesia",
        ),
        icon: BitmapDescriptor.defaultMarker,
      ),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google Maps - Add Marker"),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _initialPosition,
          zoom: 12,
        ),
        markers: _markers,
        onMapCreated: (GoogleMapController controller) {},
      ),
    );
  }
}
```


B. Bagaimana cara menampilkan info window saat marker diklik?
google_maps_flutter akan menampilkan info window saat marker diklik jika Anda telah mengatur infoWindow pada marker. Jika ingin menangani interaksi khusus saat marker diklik, gunakan properti onTap dari Marker.
```dart
void _addMarker() {
  _markers.add(
    Marker(
      markerId: MarkerId("jakarta_marker"),
      position: _initialPosition,
      infoWindow: InfoWindow(
        title: "Jakarta",
        snippet: "Ibu Kota Indonesia",
      ),
      icon: BitmapDescriptor.defaultMarker,
      onTap: () {
        print("Marker Jakarta diklik!");
      },
    ),
  );
  setState(() {});
}
```

## 4. Menggunakan Place Picker
A. Apa itu Place Picker, dan bagaimana cara kerjanya di Flutter dan sebutkan nama package yang digunakan untuk implementasi Place Picker di Flutter.
- Place Picker adalah sebuah fitur yang memungkinkan pengguna memilih lokasi di peta, biasanya digunakan untuk mendapatkan koordinat lokasi berupa latitude dan longitude.
- Place Picker bekerja dengan memanfaatkan Google Maps API untuk menampilkan peta interaktif. Pengguna dapat memilih lokasi pada peta, dan aplikasi akan mengembalikan koordinat lokasi tersebut.
- package yang sering digunakan adalah:  
i. google_maps_flutter  
ii. geolocator (untuk mendapatkan lokasi perangkat saat ini)  
iii. flutter_google_places (untuk pencarian tempat berdasarkan kata kunci)  

B. Tuliskan kode untuk menampilkan Place Picker, lalu kembalikan lokasi yang dipilih oleh pengguna dalam bentuk latitude dan longitude.
```dart
import 'package:flutter/material.dart';
import 'package:place_picker/place_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PlacePickerDemo(),
    );
  }
}

class PlacePickerDemo extends StatelessWidget {
  final String googleApiKey = "YOUR_GOOGLE_API_KEY";

  void showPlacePicker(BuildContext context) async {
    LocationResult? result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PlacePicker(googleApiKey),
      ),
    );

    if (result != null) {
      print("Latitude: ${result.latLng?.latitude}");
      print("Longitude: ${result.latLng?.longitude}");
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Lokasi Dipilih"),
          content: Text(
            "Latitude: ${result.latLng?.latitude}\nLongitude: ${result.latLng?.longitude}",
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Place Picker Demo"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => showPlacePicker(context),
          child: Text("Pilih Lokasi"),
        ),
      ),
    );
  }
}
```
