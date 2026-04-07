import 'dart:io';

void main() {
  String nome;
  String sexo;
  int idade;
  String experiencia;

  int totalMasc = 0;
  int totalFem = 0;

  int somaIdadeMascExp = 0;
  int qtdMascExp = 0;

  int mascMais45 = 0;

  int femMenor30Exp = 0;

  String nomeMenorFemExp = '';
  int menorIdadeFemExp = 999;

  while (true) {
    print('\nDigite o nome (FIM para encerrar):');
    nome = stdin.readLineSync()!;

    if (nome.toUpperCase() == 'FIM') break;

    print('Sexo (M/F):');
    sexo = stdin.readLineSync()!.toUpperCase();

    print('Idade:');
    idade = int.parse(stdin.readLineSync()!);

    print('Tem experiência? (S/N):');
    experiencia = stdin.readLineSync()!.toUpperCase();

    // a) contagem de sexo
    if (sexo == 'M') {
      totalMasc++;

      // b) idade média homens com experiência
      if (experiencia == 'S') {
        somaIdadeMascExp += idade;
        qtdMascExp++;
      }

      // c) homens com mais de 45
      if (idade > 45) {
        mascMais45++;
      }
    } else if (sexo == 'F') {
      totalFem++;

      // d) mulheres <30 com experiência
      if (idade < 30 && experiencia == 'S') {
        femMenor30Exp++;
      }

      // e) mulher com menor idade e experiência
      if (experiencia == 'S' && idade < menorIdadeFemExp) {
        menorIdadeFemExp = idade;
        nomeMenorFemExp = nome;
      }
    }
  }

  print('\n===== RESULTADOS =====');

  // a)
  print('Total Masculino: $totalMasc');
  print('Total Feminino: $totalFem');

  // b)
  if (qtdMascExp > 0) {
    double media = somaIdadeMascExp / qtdMascExp;
    print('Idade média homens com experiência: ${media.toStringAsFixed(2)}');
  } else {
    print('Nenhum homem com experiência.');
  }

  // c)
  if (totalMasc > 0) {
    double porcentagem = (mascMais45 / totalMasc) * 100;
    print('Porcentagem homens >45: ${porcentagem.toStringAsFixed(2)}%');
  }

  // d)
  print('Mulheres <30 com experiência: $femMenor30Exp');

  // e)
  if (nomeMenorFemExp != '') {
    print('Nome da mulher mais nova com experiência: $nomeMenorFemExp');
  } else {
    print('Nenhuma mulher com experiência.');
  }
}
