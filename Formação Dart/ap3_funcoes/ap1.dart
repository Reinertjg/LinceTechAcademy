import 'dart:math';

void main() {
    final random = Random();

    List<int> listaNumeros1 = List.generate(5, (index) =>  random.nextInt(100));
    List<int> listaNumeros2 = List.generate(5, (index) =>  random.nextInt(100));

    escreverListas(listaNumeros1, listaNumeros2);

    somaListas(listaNumeros1, listaNumeros2);
}

void escreverListas (List listaNumeros1, List listaNumeros2) {
  print("Lista: ${listaNumeros1.join(", ")} ");
  print("Lista: ${listaNumeros2.join(", ")} ");
}

void somaListas (List listaNumeros1, List listaNumeros2) {
  List<int> listaSoma = [];

  for (var i in listaNumeros1.asMap().keys) {
    print("${listaNumeros1[i]}+${listaNumeros2[i]}");
    listaSoma.add(listaNumeros1[i] + listaNumeros2[i]);
  }

  print("Lista: ${listaSoma.join(", ")} ");
}
