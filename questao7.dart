//Questão 7

import 'dart:io';
import 'dart:math';

double calcularFatorial(int n) {
  if (n == 0 || n == 1) return 1;
  double fat = 1;
  for (int i = 2; i <= n; i++) {
    fat *= i;
  }
  return fat;
}

void main() {
  print('Digite o valor de X:');
  double x = double.parse(stdin.readLineSync()!);

  print('Digite o número de termos:');
  int nTermos = int.parse(stdin.readLineSync()!);

  double s = 0;
  int baseFatorial = 1;
  int padrao = 1;

  //quando fatorial for 4, subtrair 1 até chegar em 1; quando fatorial for 1, somar 1 até chegar em 4
  for (int i = 1; i <= nTermos; i++) {
    int expoente = i + 1;
    double termo = pow(x, expoente) / calcularFatorial(baseFatorial);
    s += termo;

    print('Termo $i: ($x^$expoente) / $baseFatorial! = $termo');

    baseFatorial += padrao;
    if (baseFatorial == 4) {
      padrao = -1;
    } else if (baseFatorial == 1) {
      padrao = 1;
    }
  }

  print('\nValor da série S = $s');
}
