import 'dart:io';

void main() {

    String palavraSecreta = "dromedario";

    List<String> letrasDaPalavra = List.filled(palavraSecreta.length, "_");
    List<String> letrasDigitadas = [];

    int qtdTentativas = 0;
    int qtdErros = 0;
    int maxErros = 6;

    while (qtdErros < maxErros && letrasDaPalavra.contains("_")) {
        print("\nPalavra: ${letrasDaPalavra.join(" ")}");
        print("\nLetras digitadas: ${letrasDigitadas.join(", ")}");
        print("Tentativas: $qtdTentativas");
        print("Erros: $qtdErros/$maxErros");

        stdout.write("\nDigite uma letra: ");
        String letra = stdin.readLineSync()!.toLowerCase();

        if (letra.length != 1 || !RegExp(r'^[a-z]$').hasMatch(letra)) {
            print("\nEntrada inválida. Digite apenas uma letra.");
            continue;
        }

        if (letrasDigitadas.contains(letra)) {
            print("\nVocê já digitou essa letra. Tente outra.");
            continue;
        }

        letrasDigitadas.add(letra);
        qtdTentativas++;

        if (palavraSecreta.contains(letra)) {
            for (int i = 0; i < palavraSecreta.length; i++) {
                if (palavraSecreta[i] == letra) {
                    letrasDaPalavra[i] = letra;
                }
            }
        } else {
            qtdErros++;
            print("Letra incorreta! Erros: $qtdErros/$maxErros");
        }
    }

    if (!letrasDaPalavra.contains("_")) {
        print("Parabéns! Você acertou a palavra: $palavraSecreta");
    } else {
        print("Game Over! A palavra era: $palavraSecreta");
    }
}