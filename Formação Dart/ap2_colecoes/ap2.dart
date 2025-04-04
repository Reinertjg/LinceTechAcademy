import 'dart:math';

void main() {
  List<int> numeros = []; // Criando uma lista vazia
  const int totalNumeros = 50;
  final random = Random();

  for (int i = 0; i < totalNumeros; i++) {
    var numeroAleatorio = random.nextInt(15);
    numeros.add(numeroAleatorio);
  }

  print("Lista original: ${numeros}");
  numeros.removeWhere((numero) => numero % 2 == 0);
  print("Lista atualizada: $numeros");
}
