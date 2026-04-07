import 'dart:io';

String classificarPeso(double peso) {
  if (peso <= 2) {
    return "Baixo Peso";
  } else if (peso <= 4) {
    return "Normal";
  } else {
    return "Alto Peso";
  }
}

void main() {
  print("Digite a quantidade de recem-nascidos:");
  int n = int.parse(stdin.readLineSync()!);

  int baixo = 0, normal = 0, alto = 0;

  String nomeMaiorF = "";
  double maiorPesoF = -1;

  for (int i = 0; i < n; i++) {
    print("Digite o nome:");
    String nome = stdin.readLineSync()!;

    print("Digite o sexo (M/F):");
    String sexo = stdin.readLineSync()!;

    print("Digite o peso:");
    double peso = double.parse(stdin.readLineSync()!);

    String classificacao = classificarPeso(peso);

    print("Nome: $nome");
    print("Sexo: $sexo");
    print("Classificacao: $classificacao");

    if (classificacao == "Baixo Peso") baixo++;
    else if (classificacao == "Normal") normal++;
    else alto++;

    if (sexo == "F" && peso > maiorPesoF) {
      maiorPesoF = peso;
      nomeMaiorF = nome;
    }
  }

  print("Menina com maior peso: $nomeMaiorF");

  print("Percentual Baixo Peso: ${(baixo / n) * 100}%");
  print("Percentual Normal: ${(normal / n) * 100}%");
  print("Percentual Alto Peso: ${(alto / n) * 100}%");
}