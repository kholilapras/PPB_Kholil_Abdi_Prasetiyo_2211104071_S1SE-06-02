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