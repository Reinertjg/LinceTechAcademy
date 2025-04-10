import 'dart:math';

void main() {

  // Instância da classe Random para geração de números aleatórios.
  final random = Random();
  // Gera o número aleatório entre 0 e 99.
  var numeroAleatorio1 = random.nextInt(100);
  var numeroAleatorio2 = random.nextInt(100);

  print("Numeros gerados: \n"
        "Numero 1: $numeroAleatorio1 \n"
        "Numero 2: $numeroAleatorio2");

  // Inverte os valores das variáveis usando desestruturação.
  (numeroAleatorio1, numeroAleatorio2) = (numeroAleatorio2, numeroAleatorio1);

  print("Valores das variaveis invertidos: \n"
      "Numero 1: $numeroAleatorio1 \n"
      "Numero 2: $numeroAleatorio2");

}