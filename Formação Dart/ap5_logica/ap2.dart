import 'dart:math';

void main() {
  var random = Random();
  // Cria uma lista com 5 numeros gerados aleatoriamente de 1 a 26.
  List<int> listaNumeros = List.generate(5, (_) => (random.nextInt(26)));

  // Percorre todos os dados da lista
  for(var numero in listaNumeros) {
    print("Numero ${numero} -> ${obterAlfabeto(numero)}");
  }
}

// Funcao que recebe um inteiro e retorna uma String com a letra gerada.
String obterAlfabeto(int valor) {

  // Gera a letra Char a partir do 65 inteiro
  var letra = String.fromCharCode(valor + 64);

  // Retorna uma String com a letra gerada.
  return letra;
}
