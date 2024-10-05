<div align="center">

**LAPORAN PRAKTIKUM**  
**PEMROGRAMAN PERANGKAT BERGERAK**

**PRAKTIKUM 3**  
**PENGENALAN DART**


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

## Tugas Percabangan (Branching)
**Soal :**  
Buatlah sebuah fungsi dalam Dart yang menerima sebuah nilai dari user, lalu melakukan percabangan untuk memberikan output berdasarkan kondisi berikut:

**Deskripsi :**
- a. Jika nilai **lebih besar dari 70**, program harus mereturn **"Nilai A"**.
- b. Jika nilai **lebih besar dari 40** tetapi **kurang atau sama dengan 70**, program harus mereturn **"Nilai B"**.
- c. Jika nilai **lebih besar dari 0** tetapi **kurang atau sama dengan 40**, program harus mereturn **"Nilai C"**.
- d. Jika nilai tidak memenuhi semua kondisi di atas, program harus mereturn teks kosong.

**Sampel Input :** 80  
**Sampel Output :** 80 merupakan Nilai A

**Sampel Input :** 50  
**Sampel Output :** 50 merupakan Nilai B


#### Source Code
```dart
import 'dart:io';

String kategoriNilai(int nilai) {
  if (nilai > 70) {
    return "A";
  } else if (nilai > 40 && nilai <= 70) {
    return "B";
  } else if (nilai > 0 && nilai <= 40) {
    return "C";
  } else {
    return "Tidak Terdapat Dalam Kategori Nilai";
  }
}

void main() {
  stdout.write('Masukkan Nilai : ');
  int nilai = int.parse(stdin.readLineSync()!);

  String hasil = kategoriNilai(nilai);

  if (hasil.isNotEmpty) {
    print('$nilai merupakan Nilai $hasil');
  } else {
    print('Nilai tidak valid !!!');
  }
}
```
#### Output
![Screenshot 2024-10-05 121357](https://github.com/user-attachments/assets/1b95122b-b290-4488-8e13-1b7759d4bbce)

#### Deskripsi
- Fungsi tersebut menerima input berupa angka nilai dan mengembalikan nilai kategori berdasarkan kondisional if-else.
- Kategori nilai ditentukan sebagai berikut:  
  a. Nilai di atas 70 dikategorikan sebagai "A".  
  b. Nilai antara 41 hingga 70 dikategorikan sebagai "B".  
  c. Nilai antara 1 hingga 40 dikategorikan sebagai "C".  
  d. Selain itu, jika nilai di luar rentang (misalnya, negatif), dikembalikan string "Tidak Terdapat Dalam Kategori Nilai".  

- Setelah nilai diterima, fungsi kategoriNilai dipanggil untuk menentukan kategori nilai tersebut.  
- Jika hasil kategori tidak kosong program akan mencetak nilai beserta kategorinya. Jika tidak valid, pesan kesalahan akan ditampilkan.  

---

## Tugas Looping (Perulangan)
**Soal :**  
Buatlah sebuah program dalam Dart yang menampilkan piramida bintang dengan menggunakan for loop. Panjang piramida ditentukan oleh input dari user.

**Contoh Output :**

<img src="https://github.com/user-attachments/assets/cf786e46-3997-4967-ba66-c7ef5b268620" alt="image" width="20%">

#### Source Code
```dart
import 'dart:io';

void main() {
  stdout.write('Masukkan panjang piramida: ');
  int panjang = int.parse(stdin.readLineSync()!);

  for (int i = 1; i <= panjang; i++) {
    for (int j = 1; j <= panjang - i; j++) {
      stdout.write(' ');
    }

    for (int k = 1; k <= (2 * i - 1); k++) {
      stdout.write('*');
    }

    print('');
  }
}
```

#### Output
![image](https://github.com/user-attachments/assets/3c9518c0-09a9-4a3b-84da-8f7127baabf6)

#### Deskripsi
- Program meminta input panjang piramida dari pengguna menggunakan stdin.readLineSync() dan mengubahnya menjadi tipe data int.
- Loop pertama (for (int i = 1; i <= panjang; i++)) mengatur baris piramida yang akan dicetak.
- Loop kedua (for (int j = 1; j <= panjang - i; j++)) mencetak spasi untuk mengatur posisi bintang di setiap baris.
- Loop ketiga (for (int k = 1; k <= (2 * i - 1); k++)) mencetak jumlah bintang yang sesuai di setiap baris, semakin banyak di baris bawah.
- Setelah selesai mencetak bintang di satu baris, print('') digunakan untuk pindah ke baris berikutnya.

---

## Tugas Function
**Soal :**  
Buatlah program Dart yang meminta input berupa sebuah bilangan bulat dari user, kemudian program akan mengecek apakah bilangan tersebut merupakan bilangan prima atau bukan.

**Sampel Input :** 23  
**Sampel Output :** bilangan prima  
**Sampel Input :** 12  
**Sampel Output :** bukan bilangan prima

#### Source Code
```dart
import 'dart:io';

void main() {
  stdout.write('Masukkan Angka: ');
  int angka = int.parse(stdin.readLineSync()!);

  if (cekBilanganPrima(angka)) {
    print('$angka merupakan bilangan prima');
  } else {
    print('$angka bukan bilangan prima');
  }
}

bool cekBilanganPrima(int n) {
  if (n <= 1) return false;
  for (int i = 2; i <= n ~/ 2; i++) {
    if (n % i == 0) return false;
  }
  return true;
}
```

#### Output

![image](https://github.com/user-attachments/assets/61c4da88-5d1c-4f4c-9241-e2c1fc5f5dca)

#### Deskripsi
- Fungsi stdout.write digunakan untuk menampilkan prompt "Masukkan Angka: ".
- stdin.readLineSync() digunakan untuk membaca input dari pengguna. Metode int.parse() mengonversi input yang berupa string menjadi integer.
- Setelah mendapatkan input angka, program memanggil fungsi cekBilanganPrima untuk mengecek apakah angka tersebut merupakan bilangan prima atau bukan.
- Hasil dari fungsi tersebut adalah true atau false, yang kemudian digunakan dalam pernyataan if-else untuk mencetak hasil.
- Jika nilai n lebih kecil atau sama dengan 1, langsung dikembalikan nilai false karena angka tersebut bukan bilangan prima.
- Pengecekan Pembagi: Menggunakan perulangan for dari angka 2 hingga setengah dari n. Jika ada angka yang membagi habis n, maka n bukan bilangan prima.
- Jika tidak ada angka yang membagi habis n, maka angka tersebut dianggap bilangan prima.
