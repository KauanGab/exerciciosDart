import 'dart:math';
import 'dart:io';  
  

void main() {
  //1
  const boloPrecos = {'ovos': 5.5, 'chocolate': 7.5, 'cenoura': 6.5};
  const ordem = ['chocolate', 'cenoura', 'morango'];

  double total = 0;

  for (var bolo in ordem) {
    if (boloPrecos.containsKey(bolo)) {
      total += boloPrecos[bolo]!;
    } else {
      print('$bolo não está no cardápio');
    }
  }

  print('Total = $total');
}