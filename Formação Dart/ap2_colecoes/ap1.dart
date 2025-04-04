import 'dart:math';

void main() {
  List<int> numeros = []; // Criando uma lista vazia
  final random = Random();

  for (int i = 0; i < 10; i++) {
    numeros.add(random.nextInt(100));
    print("Posição: $i, valor: ${numeros[i]}");
  }
}
