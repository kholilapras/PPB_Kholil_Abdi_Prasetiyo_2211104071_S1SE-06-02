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
