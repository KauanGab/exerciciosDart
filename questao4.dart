import 'dart:io';
 
void main() {
  //turma
  int totalAlunos = 0;
  int totalAprovados = 0;
  double somaMediasTurma = 0;
  double somaMediasFeminino = 0;
  int totalFeminino = 0;
 
  //melhor masc
  String matriculaMelhorMasc = '';
  double maiorMediaMasc = -1;
 
  //melhor fem
  String matriculaMelhorFem = '';
  double maiorMediaFem = -1;
 
 
  while (true) {
    stdout.write('Digite a matrícula do aluno (ou 00000 para encerrar):');
    String matricula = stdin.readLineSync()!.trim();
    
    if (matricula == '00000') {
      break;
    }
    
    stdout.write('Nome: ');
    String nome = stdin.readLineSync()!.trim();
   
    stdout.write('Sexo (M/F): ');
    String sexo = stdin.readLineSync()!.trim().toUpperCase();
    
    stdout.write('Nota 1: ');
    double nota1 = double.parse(stdin.readLineSync()!.trim());
 
    stdout.write('Nota 2: ');
    double nota2 = double.parse(stdin.readLineSync()!.trim());
 
    stdout.write('Nota 3: ');
    double nota3 = double.parse(stdin.readLineSync()!.trim());
    
    stdout.write('Número de faltas: ');
    int faltas = int.parse(stdin.readLineSync()!.trim());
 
    //media
    double media = (nota1 + nota2 + nota3) / 3;
 
    //se foi aprovado
    bool aprovado = (media >= 7.0) && (faltas <= 18);
    
    if (aprovado) {
      totalAprovados++;
    }
    
    totalAlunos++;
    somaMediasTurma += media;
    
    if (sexo == 'F') {
      totalFeminino++;
      somaMediasFeminino += media;
 
      //melhor media feminin
      if (aprovado && media > maiorMediaFem) {
        maiorMediaFem = media;
        matriculaMelhorFem = matricula;
      }
    }
 
    //melhor media masculina
    if (sexo == 'M') {
      if (aprovado && media > maiorMediaMasc) {
        maiorMediaMasc = media;
        matriculaMelhorMasc = matricula;
      }
    }
  }
 
  // Verifica se pelo menos 1 aluno foi cadastrado
  if (totalAlunos == 0) {
    print('Nenhum aluno foi cadastrado');
    return;
  }
 
  print('----------- RESULTADOS FINAIS ----------');
 
  //meida turma
  double mediaTurma = somaMediasTurma / totalAlunos;
  print('Media da turma: $mediaTurma');
 
  //% aprovados
  double percentualAprovados = (totalAprovados / totalAlunos) * 100;
  print('% de aprovados: $percentualAprovados %');
 
  //melhores alunos
  print('Aluno com maior media aprovado:');
 
  if (matriculaMelhorMasc.isEmpty) {
    print('   Masculino: Nenhum aluno masculino aprovado');
  } else {
    print('   Masculino - $matriculaMelhorMasc - $maiorMediaMasc de media');
  }
 
  if (matriculaMelhorFem.isEmpty) {
    print('   Feminino:  Nenhuma aluna feminina aprovada');
  } else {
    print('   Feminino  - $matriculaMelhorFem - $maiorMediaFem de media');
  }
 
  // media feminina
  if (totalFeminino == 0) {
    print('media das alunas femininas: Nenhuma aluna cadastrada.');
  } else {
    double mediaFeminino = somaMediasFeminino / totalFeminino;
    print('media das alunas do sexo feminino: $mediaFeminino');
  }

}