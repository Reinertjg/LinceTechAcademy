import 'dart:math';

void main() {
  List<int> numeros = []; // Criando uma lista vazia
  final random = Random();

  for (int i = 0; i < 50; i++) {
    numeros.add(10 + random.nextInt(21 - 10 + 1));
  }

  print("Lista original: ${numeros.join(' ; ')}");
  Set<int> numerosUnicos = Set.from(numeros);
  print("Lista atualizada: ${numeros.join(' ; ')}");
}
