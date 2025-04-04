import 'dart:math';

void main() {
  List<int> numeros = []; // Criando uma lista vazia
  const int totalNumeros = 10;
  final random = Random();

  for (int i = 0; i < totalNumeros; i++) {
    var numeroAleatorio = random.nextInt(100);
    numeros.add(numeroAleatorio);
    print("Posição: $i, valor: ${numeros[i]}");
  }
}
