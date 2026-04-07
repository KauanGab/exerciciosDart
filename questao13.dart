import 'dart:io';

void main() {
  print('Digite a quantidade de números (N):');
  int n = int.parse(stdin.readLineSync()!);

  List<int> numeros = [];

  // leituura dos numeros
  for (int i = 0; i < n; i++) {
    print('Digite o ${i + 1}º número:');
    int valor = int.parse(stdin.readLineSync()!);
    numeros.add(valor);
  }

  Map<int, int> contagem = {};

  //   conta=dor de repetiçoes
  for (var num in numeros) {
    if (contagem.containsKey(num)) {
      contagem[num] = contagem[num]! + 1;
    } else {
      contagem[num] = 1;
    }
  }

  print('\n===== RESULTADO =====');

  contagem.forEach((numero, quantidade) {
    print('$numero - $quantidade');
  });
}
