import 'dart:math';

void main() {
  List<int> numeros = []; // Criando uma lista vazia
  final random = Random();

  for (int i = 0; i < 50; i++) {
    numeros.add(random.nextInt(15));
  }

  print("Lista original: ${numeros.join(' ; ')}");
  numeros.removeWhere((numero) => numero.isEven);
  print("Lista atualizada: ${numeros.join(' ; ')}");
}
