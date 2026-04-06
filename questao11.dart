import 'dart:io';

void main() {
  List<String> codigos = [];
  List<String> nomes = [];
  List<String> sexos = [];
  List<double> salariosBrutos = [];
  List<double> salariosLiquidos = [];

  const double valorPorHora = 12.30;

  print('--- CADASTRO DE PROFESSORES ----');

  while (true) {
    stdout.write('Código do professor (ou 9999 para encerrar):');
    String codigo = stdin.readLineSync()!.trim();
    
    if (codigo == '9999') {
      break;
    }

    stdout.write('Nome: ');
    String nome = stdin.readLineSync()!.trim();

    stdout.write('Sexo (M/F): ');
    String sexo = stdin.readLineSync()!.trim().toUpperCase();

    stdout.write('Horas de aula no mês: ');
    int horas = int.parse(stdin.readLineSync()!.trim());

    //bruto
    double salarioBruto = horas * valorPorHora;

    //liquido
    double desconto;
    if (sexo == 'M') {
      desconto = salarioBruto * 0.10;
    } else {
      desconto = salarioBruto * 0.05;
    }

    double salarioLiquido = salarioBruto - desconto;

    // Armazena tudo nos vetores
    codigos.add(codigo);
    nomes.add(nome);
    sexos.add(sexo);
    salariosBrutos.add(salarioBruto);
    salariosLiquidos.add(salarioLiquido);

    print('Professor cadastrado!');
  }
  
  if (codigos.isEmpty) {
    print('Nenhum professor cadastrado.');
    return;
  }

  print('Cod | Nome  | Sal. Bruto | Liquido');
  print('------------------------------------------------------');

  for (int i = 0; i < codigos.length; i++) {
    String cod = codigos[i];
    String nom = nomes[i];
    String bruto = 'R\$ ${salariosBrutos[i]}';
    String liquido = 'R\$ ${salariosLiquidos[i]}';
    print('$cod | $nom | $bruto | $liquido');
  }

  print('------------------------------------');

  // ===== CALCULA MÉDIAS POR SEXO =====
  double somaMasc = 0;
  int totalMasc = 0;
  double somaFem = 0;
  int totalFem = 0;

  for (int i = 0; i < codigos.length; i++) {
    if (sexos[i] == 'M') {
      somaMasc += salariosLiquidos[i];
      totalMasc++;
    } else {
      somaFem += salariosLiquidos[i];
      totalFem++;
    }
  }  

  if (totalMasc > 0) {
    double mediaMasc = somaMasc / totalMasc;
    print('Media masculina: R\$ $mediaMasc ($totalMasc professor(es))');
  } else {
    print('Media masculina: nenhum professor masculino cadastrado.');
  }

  if (totalFem > 0) {
    double mediaFem = somaFem / totalFem;
    print('MMedia feminina:  R\$ $mediaFem. ($totalFem professora (as))');
  } else {
    print('Média feminina: nenhuma professora cadastrada.');
  }

}