
void main() {
  try {
    // Tenta validar se o número fornecido é par.
    validaNumerosPares(11); // Aqui você pode trocar o número para testar outros casos.
    print("Entrada correta, você inseriu um número par.");
  } on Exception catch (e) {
    // Captura a exceção lançada pela função e imprime a mensagem de erro.
    print(e);
  }
}

void validaNumerosPares(int valor) {
  // Verifica se o número é ímpar usando a propriedade isOdd
  if (valor.isOdd) {
    // Lança uma exceção com uma mensagem personalizada se o número for ímpar
    throw "Exception: Entrada inválida. Insira apenas números pares.";
   }
}