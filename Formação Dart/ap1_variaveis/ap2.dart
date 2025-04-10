
import 'dart:io';

void main() {
  List<double> numeros = []; // Criando uma lista vazia
  var media = 0.0;
  const int totalNumeros = 4;
  double soma = 0.0;

  // Laço que percorre de 0 até totalNumeros - 1 para coletar os números do usuário.
  for (int i =0; i < totalNumeros; i++) {
    print("Informe o numero ${i + 1}");
    double numero = double.parse(stdin.readLineSync()!);
    numeros.add(numero);
    soma += numeros[i];

    // Quando a lista atingir o total necessário, calcula e exibe a média.
    if (numeros.length == totalNumeros) {
      media = soma / totalNumeros;
      print("A media entre $numeros = $media");
    }
  }

}