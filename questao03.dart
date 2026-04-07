import 'dart:io';

void main() {

    stdout.write('Digites quantos termos: ')

    int qtdTermos = int.parse(stdin.readLineSync()!.trim());

    int primeiroTermo = 0;
    int segundoTermo = 5;
    int terceiroTermo = 100;

    int contador = 0;

    while (contador < qtdTermos) {
        if (contador < qtdTermos) {
            stdout.write('$primeiroTermo ');
            contador++;
        }

        if (contador < qtdTermos) {
            stdout.write('$segundoTermo ');
            contador++;
        }

        if (contador < qtdTermos) {
            stdout.write('$terceiroTermo ');
            contador++;
        }

        primeiroTermo *= 2;
        segundoTermo += 5;
        terceiroTermo -= 10;
    }
}