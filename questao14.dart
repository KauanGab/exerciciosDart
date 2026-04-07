import 'dart:io';

List<int> lerVetor(int tamanho, String nome) {
  List<int> vetor = [];
  print("Digite os valores do $nome (em ordem crescente):");
  for (int i = 0; i < tamanho; i++) {
    vetor.add(int.parse(stdin.readLineSync()!));
  }
  return vetor;
}

List<int> mesclarVetores(List<int> v1, List<int> v2) {
  List<int> resultado = [];
  int i = 0, j = 0;

  while (i < v1.length && j < v2.length) {
    if (v1[i] <= v2[j]) {
      resultado.add(v1[i]);
      i++;
    } else {
      resultado.add(v2[j]);
      j++;
    }
  }

  while (i < v1.length) {
    resultado.add(v1[i]);
    i++;
  }

  while (j < v2.length) {
    resultado.add(v2[j]);
    j++;
  }

  return resultado;
}

void main() {
  print("Digite o tamanho do primeiro vetor:");
  int t1 = int.parse(stdin.readLineSync()!);

  List<int> v1 = lerVetor(t1, "vetor 1");

  print("Digite o tamanho do segundo vetor:");
  int t2 = int.parse(stdin.readLineSync()!);

  List<int> v2 = lerVetor(t2, "vetor 2");

  List<int> v3 = mesclarVetores(v1, v2);

  print("Vetor ordenado:");
  for (int valor in v3) {
    print(valor);
  }
}