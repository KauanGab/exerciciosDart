//Questão 16

import 'dart:io';

List<int> lerVetor(int indice) {
  print('\n--- Vetor $indice ---');
  print('Digite o tamanho do vetor:');
  int tamanho = int.parse(stdin.readLineSync()!);

  List<int> vetor = [];
  for (int i = 0; i < tamanho; i++) {
    print('Digite o elemento ${i + 1}:');
    vetor.add(int.parse(stdin.readLineSync()!));
  }
  return vetor;
}

void main() {
  //valores
  List<int> v1 = lerVetor(1);
  List<int> v2 = lerVetor(2);
  List<int> v3 = lerVetor(3);
  List<int> v4 = lerVetor(4);

  //a)
  List<int> v5 = [...v1, ...v2, ...v3, ...v4];
  v5.sort();
  print('\na) Vetor 5 (Todos os elementos ordenados):');
  print(v5);

  //b)
  Set<int> set1 = v1.toSet();
  Set<int> set2 = v2.toSet();
  Set<int> set3 = v3.toSet();
  Set<int> set4 = v4.toSet();

  //elementos em comum
  Set<int> intersecssaoL = set1
      .intersection(set2)
      .intersection(set3)
      .intersection(set4);
  List<int> intercecssao = intersecssaoL.toList();

  print('\nb) Vetor de Interseção (elementos presentes nos 4 vetores):');
  if (intercecssao.isEmpty) {
    print('Nenhum elemento em comum entre todos os vetores.');
  } else {
    print(intercecssao);
  }
}
