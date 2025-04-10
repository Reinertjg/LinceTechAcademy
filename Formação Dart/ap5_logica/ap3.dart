import 'dart:math';

void main() {
  var random = Random();
  // Gera um numero aleatório de 100 ate 1000.
  int numero = 100 + random.nextInt(1000 - 100 + 1);

  // Imprime o resultado.
  print("A soma dos números pares entre 0 e $numero é ${obterSomaPares(numero)}");
}

// Funcao que recebe um inteiro e retorna a soma de todos os números pares de 0 até esse número.
int obterSomaPares(int valor) {
  int soma = 0;
  for (int i = 0; i <= valor; i++) {
    if (i.isEven) {
      soma += i;
    }
  }
  return soma;
}
