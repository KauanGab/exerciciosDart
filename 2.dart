//Questão 2

import 'dart:io';
import 'dart:math';

double calcularFatorial(int n) {
  double fat = 1;
  for (int i = 2; i <= n; i++) {
    fat *= i;
  }
  return fat;
}

void main() {
  print('Digite o número de termos da série:');
  String? input = stdin.readLineSync();

  //validação e calculo
  if (input != null && int.tryParse(input) != null) {
    int nTermos = int.parse(input);
    double somaTotal = 0;

    for (int i = 1; i <= nTermos; i++) {
      int base = 2 * i + 1;
      int valorBaseFatorial = 4 * i;
      double expoente = calcularFatorial(valorBaseFatorial);
      int denominador = 5 * i;

      //termos 4 e 6 em diante negativos
      int sinal = 1;
      if (i >= 4 && i % 2 == 0) {
        sinal = -1;
      }

      double termo = sinal * (pow(base, expoente) / denominador);

      somaTotal += termo;

      String sinalStr = sinal == 1 ? '+' : '-';
      print(
        'Termo $i: $sinalStr ($base^$valorBaseFatorial!) / $denominador = $termo',
      );
    }

    print('\nValor final da série S = $somaTotal');
  } else {
    print('Por favor, digite um número inteiro válido.');
  }
}
