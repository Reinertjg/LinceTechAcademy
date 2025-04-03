import 'dart:math';

void main() {

  final random = Random();
  var numeroAleatorio1 = random.nextInt(100);
  var numeroAleatorio2 = random.nextInt(100);

  print("Numeros gerados: \n"
        "Numero 1: $numeroAleatorio1 \n"
        "Numero 2: $numeroAleatorio2");

  (numeroAleatorio1, numeroAleatorio2) = (numeroAleatorio2, numeroAleatorio1);

  print("Valores das variaveis invertidos: \n"
      "Numero 1: $numeroAleatorio1 \n"
      "Numero 2: $numeroAleatorio2");

}