void main() {
  int limiteSuperior = 10;

  // Itera sobre cada número ímpar retornado pela função `obterNumerosImpares`,
  obterNumerosImpares(limiteSuperior).forEach((numeroImpar) {
    print("Número ímpar: $numeroImpar");
  });
}

// Funcao que retorna uma lista contendo todos os numeros impares de 0 ate o valor do limite informado
List<int> obterNumerosImpares(int limite) {
  List<int> numerosImpares = [];

  // Estrutura de repeticao que percorre todos os numeros de 0 ate o limite, inclusive
  for (int i = 0; i <= limite; i++) {
    if (i.isOdd) {
      numerosImpares.add(i);
    }
  }

  // Retorna uma lista
  return numerosImpares;
}
