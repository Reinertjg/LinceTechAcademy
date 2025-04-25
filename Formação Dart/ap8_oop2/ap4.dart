import 'dart:math';

void main() {
  final random = Random();
  final numeroAleatorio = random.nextInt(100);
  print("O dobro do numero $numeroAleatorio e: ${Calculadora.dobro(numeroAleatorio)}");
}

abstract class Calculadora {
  static int dobro(int valor) => valor * 2;
}
