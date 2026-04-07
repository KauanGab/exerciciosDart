//Questão 19

import 'dart:io';

void imprimirTabuleiro(List<List<String>> tabuleiro) {
  print('\n  0   1   2'); //índices das colunas
  for (int i = 0; i < 3; i++) {
    print('$i ${tabuleiro[i][0]} | ${tabuleiro[i][1]} | ${tabuleiro[i][2]}');
    if (i < 2) print('  --+---+--');
  }
  print('');
}

bool verificarVitoria(List<List<String>> tab, String jogador) {
  for (int i = 0; i < 3; i++) {
    //Linha
    if (tab[i][0] == jogador && tab[i][1] == jogador && tab[i][2] == jogador)
      return true;
    //Coluna
    if (tab[0][i] == jogador && tab[1][i] == jogador && tab[2][i] == jogador)
      return true;
  }
  if (tab[0][0] == jogador && tab[1][1] == jogador && tab[2][2] == jogador)
    return true;
  if (tab[0][2] == jogador && tab[1][1] == jogador && tab[2][0] == jogador)
    return true;

  return false;
}

void main() {
  List<List<String>> tabuleiro = List.generate(3, (_) => List.filled(3, ' '));

  String jogadorAtual = 'X';
  int jogadas = 0;

  print('=== JOGO DA VELHA ===');

  while (true) {
    imprimirTabuleiro(tabuleiro);
    print('Vez do jogador [$jogadorAtual].');

    print('Digite a linha (0 a 2):');
    int? linha = int.tryParse(stdin.readLineSync() ?? '');

    print('Digite a coluna (0 a 2):');
    int? coluna = int.tryParse(stdin.readLineSync() ?? '');

    if (linha == null ||
        coluna == null ||
        linha < 0 ||
        linha > 2 ||
        coluna < 0 ||
        coluna > 2) {
      print('Posição inválida! Digite números entre 0 e 2.');
      continue;
    }

    if (tabuleiro[linha][coluna] != ' ') {
      print('Essa posição já está ocupada');
      continue;
    }

    //Registra a jogada
    tabuleiro[linha][coluna] = jogadorAtual;
    jogadas++;

    if (verificarVitoria(tabuleiro, jogadorAtual)) {
      imprimirTabuleiro(tabuleiro);
      print('FIM DE JOGO! O jogador [$jogadorAtual] venceu!');
      break;
    }

    if (jogadas == 9) {
      imprimirTabuleiro(tabuleiro);
      print('FIM DE JOGO! Deu Empate');
      break;
    }

    jogadorAtual = (jogadorAtual == 'X') ? 'O' : 'X';
  }
}
