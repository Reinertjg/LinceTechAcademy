import 'dart:io';

void main() {
  print("Digite um numero inteiro.");
  var numeroString = stdin.readLineSync();

  // Chama a função para tentar converter a string em inteiro
  getConversaoString(numeroString);

}

// Função que tenta converter uma string para inteiro
void getConversaoString(String? valorString) {
  try {
    int valorInteiro = int.parse(valorString!); // O operador "!" é usado aqui para garantir que a string não seja nula
    print("Numero digitado: $valorInteiro");
  } on Exception {
    // Captura qualquer exceção do tipo genérico Exception (por exemplo, se a entrada não for um número válido)
    print("Entrada invalida. Digite apenas números inteiros.");
  }
}
