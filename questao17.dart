import 'dart:io';

List<int> lerVetor(int tamanho, String nome) {
  List<int> vetor = [];
  print("Digite os valores do $nome:");
  for (int i = 0; i < tamanho; i++) {
    vetor.add(int.parse(stdin.readLineSync()!));
  }
  return vetor;
}

List<int> somarVetores(List<int> v1, List<int> v2) {
  List<int> resultado = [];
  for (int i = 0; i < v1.length; i++) {
    resultado.add(v1[i] + v2[i]);
  }
  return resultado;
}

int somaTotal(List<int> vetor) {
  int soma = 0;
  for (int valor in vetor) {
    soma += valor;
  }
  return soma;
}

void main() {
  print("Digite o tamanho do vetor:");
  int tamanho = int.parse(stdin.readLineSync()!);

  List<int> v1 = lerVetor(tamanho, "vetor 1");
  List<int> v2 = lerVetor(tamanho, "vetor 2");

  List<int> v3 = somarVetores(v1, v2);

  print("Vetor resultante:");
  for (int valor in v3) {
    print(valor);
  }

  print("Soma total: ${somaTotal(v3)}");
}