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