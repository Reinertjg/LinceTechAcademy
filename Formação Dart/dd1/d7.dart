
void main() {
  List<int> numeros = [10, 35, 999, 126, 95, 7, 348, 462, 43, 109];

  print(""
      "for: ${somaFor(numeros)} \n"
      "while: ${somaWhile(numeros)} \n"
      "recursão: ${somaRecursao(numeros, 0)} \n"
      "lista: ${numeros.reduce((i, j) => i + j)}  ");
}

int somaFor(List<int> numeros) {
  int soma = 0;
  for(var numero in numeros) {
    soma += numero;
  }

  return soma;
}

int somaWhile(List<int> numeros) {
  int i = 0;
  int soma = 0;
  while(i < numeros.length) {
    soma += numeros[i];
    i++;
  }

  return soma;
}

int somaRecursao(List<int> numeros, int indice){
  if (indice >= numeros.length) {
    return 0; // Caso base: passou do final da lista
  } else {
    return numeros[indice] + somaRecursao(numeros, indice + 1); // Soma atual + próximo
  }
}