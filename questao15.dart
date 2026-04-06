import 'dart:io';
 
void main() {
  stdout.write('Quantos bois deseja cadastrar? ');
  int numeroBois = int.parse(stdin.readLineSync()!.trim());
  
  List<int> numeros = [];
  List<double> pesos = [];
 
  //loop pra cadastrar 
  for (int i = 0; i < numeroBois; i++) {
    print('--- Boi ${i + 1} ---');
 
    stdout.write('Número do boi: ');
    int numero = int.parse(stdin.readLineSync()!.trim());
 
    stdout.write('Peso do boi: ');
    double peso = double.parse(stdin.readLineSync()!.trim());

    numeros.add(numero);
    pesos.add(peso);
  }
 
  print('${numeroBois} bois cadastrados com sucesso!');
 
  //loop pra pesquisar, termina quando digita -1
  while (true) {
 
    stdout.write('Digite o peso minimo (ou -1 para encerrar): ');
    double pesoMin = double.parse(stdin.readLineSync()!.trim());
 
    
    if (pesoMin == -1) {
      print('Encerrado com sucesso!');
      break;
    }
 
    stdout.write('Digite o peso maximo (ou -1 para encerrar): ');
    double pesoMax = double.parse(stdin.readLineSync()!.trim());
    
    if (pesoMax == -1) {
      print('Encerrado com sucesso!');
      break;
    }
 
    print('Pesquisando bois com peso entre ${pesoMin}kg e ${pesoMax}kg ');

    int encontrados = 0;
 
    for (int i = 0; i < numeroBois; i++) {
      if (pesos[i] >= pesoMin && pesos[i] <= pesoMax) {
        print('Boi nº ${numeros[i]} - Peso: ${pesos[i]} kg');
        encontrados++;
      }
    }

    if (encontrados == 0) {
      print('  Nenhum boi encontrado nesse intervalo.');
    } 
  }
}