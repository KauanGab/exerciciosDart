import 'dart:io';

void main() {
  String codigo;
  String curso;
  String nome;
  String sexo;
  double pontuacao;

  int totalCandidatos = 0;
  int totalMasculino = 0;
  int totalFeminino = 0;

  String nomeMenorMasc = '';
  double menorPontMasc = double.infinity;

  String codigoMaiorSiMasc = '';
  double maiorPontSiMasc = -1;

  print('Digite os dados dos candidatos.');
  print('Para encerrar, informe o código FLAG0000.\n');

  while (true) {
    stdout.write('Código: ');
    codigo = stdin.readLineSync()!.toUpperCase();

    if (codigo == 'FLAG0000') {
      break;
    }

    stdout.write('Curso (CC ou SI): ');
    curso = stdin.readLineSync()!.toUpperCase();

    stdout.write('Nome: ');
    nome = stdin.readLineSync()!;

    stdout.write('Sexo (M ou F): ');
    sexo = stdin.readLineSync()!.toUpperCase();

    stdout.write('Pontuação (0 a 5000): ');
    pontuacao = double.parse(stdin.readLineSync()!);

    totalCandidatos++;

    if (sexo == 'M') {
      totalMasculino++;

      if (pontuacao < menorPontMasc) {
        menorPontMasc = pontuacao;
        nomeMenorMasc = nome;
      }

      if (curso == 'SI' && pontuacao > maiorPontSiMasc) {
        maiorPontSiMasc = pontuacao;
        codigoMaiorSiMasc = codigo;
      }
    } else if (sexo == 'F') {
      totalFeminino++;
    }

    if (curso == 'CC' && pontuacao > 2500) {
      print('\nCandidato de Ciência da Computação com mais de 2500 pontos:');
      print('Código: $codigo');
      print('Nome: $nome');
      print('Pontuação: $pontuacao\n');
    }

    print('--------------------------------------');
  }

  print('\n========= RESULTADOS =========');

  if (nomeMenorMasc.isNotEmpty) {
    print(
      'b) Nome do candidato masculino com menor pontuação geral: $nomeMenorMasc',
    );
  } else {
    print('b) Não houve candidatos do sexo masculino.');
  }

  if (codigoMaiorSiMasc.isNotEmpty) {
    print(
      'c) Código do candidato masculino com maior pontuação em SI: $codigoMaiorSiMasc',
    );
  } else {
    print('c) Não houve candidatos masculinos em Sistemas de Informação.');
  }

  if (totalCandidatos > 0) {
    double percMasculino = (totalMasculino / totalCandidatos) * 100;
    double percFeminino = (totalFeminino / totalCandidatos) * 100;

    print('d) Percentual masculino: ${percMasculino.toStringAsFixed(2)}%');
    print('d) Percentual feminino: ${percFeminino.toStringAsFixed(2)}%');
  } else {
    print('d) Nenhum candidato foi cadastrado.');
  }
}
