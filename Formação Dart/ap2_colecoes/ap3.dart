import 'dart:math';

void main() {
  List<int> numeros = []; // Criando uma lista vazia
  const int totalNumeros = 50;
  final random = Random();

  for (int i = 0; i < totalNumeros; i++) {
    var numeroAleatorio = 10 + random.nextInt(21 - 10 + 1);
    numeros.add(numeroAleatorio);
  }

  print("Lista original: ${numeros}");
  Set<int> numerosUnicos = Set.from(numeros);
  print("Lista atualizada: $numerosUnicos");
}
