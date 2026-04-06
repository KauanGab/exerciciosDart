import 'dart:io';

  void main() {
  
  //12
  print('Digite um número:');
  String numero = stdin.readLineSync()!;

  String invertido = '';

  for (int i = numero.length - 1; i >= 0; i--) {
    invertido += numero[i];
  }

  print('Número invertido: $invertido');
}