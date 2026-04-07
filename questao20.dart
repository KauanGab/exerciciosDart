import 'dart:io';

void main() {

    List<List<String>> labirinto = [
        ['#', '#', '#', '#', '#', '#', '#', '#'],
        ['#', 'E', ' ', ' ', '#', ' ', ' ', '#'],
        ['#', '#', '#', ' ', '#', ' ', '#', '#'],
        ['#', ' ', ' ', ' ', ' ', ' ', '#', '#'],
        ['#', ' ', '#', '#', '#', ' ', ' ', '#'],
        ['#', ' ', ' ', ' ', '#', '#', 'S', '#'],
        ['#', '#', '#', '#', '#', '#', '#', '#'],
    ];
    
    // Posição inicial do jogador
    int posX = 1;
    int posY = 1;

    while (true) {

        exibirLabirinto(labirinto, posX, posY);

        stdout.write('Digite a direção (W/A/S/D): ');
        String? comando = stdin.readLineSync()?.toUpperCase();

        if (comando == null || comando.isEmpty) {
            print('Comando inválido. Tente novamente.');
            continue;
        }

        int novaPosX = posX;
        int novaPosY = posY;

        switch (comando) {
            case 'W':
                novaPosX--;
                break;
            case 'A':
                novaPosY--;
                break;
            case 'S':
                novaPosX++;
                break;
            case 'D':
                novaPosY++;
                break;
            default:
                print('Comando inválido. Use W, A, S ou D.');
                continue;
        }

        if (labirinto[novaPosX][novaPosY] == '#') {
            print('Você bateu em uma parede! Tente outra direção.');
        } else {
            posX = novaPosX;
            posY = novaPosY;

            if (labirinto[posX][posY] == 'S') {
                exibirLabirinto(labirinto, posX, posY);
                print('Parabéns! Você encontrou a saída!');
                break;
            }
        }
    }
}

void exibirLabirinto(List<List<String>> labirinto, int posX, int posY) {
    for (int i = 0; i < labirinto.length; i++) {
        for (int j = 0; j < labirinto[i].length; j++) {
            if (i == posX && j == posY) {
                stdout.write('P ');
            } else {
                stdout.write('${labirinto[i][j]} ');
            }
        }
        print('');
    }
}