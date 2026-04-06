import 'dart:math';
import 'dart:io';

void main() {

  //1
  const boloPrecos = {'ovos': 5.5, 'chocolate': 7.5, 'cenoura': 6.5};
  const ordem = ['chocolate', 'cenoura', 'morango'];

  double total = 0;

  for (var bolo in ordem) {
    if (boloPrecos.containsKey(bolo)) {
      total += boloPrecos[bolo]!;
    } else {
      print('$bolo não está no cardápio');
    }
  }

  print('Total = $total');


  //6
  var random = Random();
  int segredo = random.nextInt(100) + 1;

  int menor = 0;
  int maior = 100;

  print('Tente adivinhar o número entre $menor e $maior:');
  int tentativa = int.parse(stdin.readLineSync()!);

  while (true) {
    if (tentativa == segredo) {
      break;
    }

    if (tentativa > segredo) {
      maior = tentativa;
    } else {
      menor = tentativa;
    }

    print('Agora o número está entre $menor e $maior');
    print('Digite outro número:');
    tentativa = int.parse(stdin.readLineSync()!);
  }

  print('Acertou!');


  //12
  print('Digite um número:');
  String numero = stdin.readLineSync()!;

  String invertido = '';

  for (int i = numero.length - 1; i >= 0; i--) {
    invertido += numero[i];
  }

  print('Número invertido: $invertido');
}