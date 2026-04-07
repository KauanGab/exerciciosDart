import 'dart:math';
import 'dart:io'; 

void main() {

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


}