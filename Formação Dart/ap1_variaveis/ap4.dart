import 'dart:math';

void main() {

  final random = Random();
  var numeroAleatorio1 = random.nextInt(100);
  var numeroAleatorio2 = random.nextInt(100);
  var resultado = numeroAleatorio1 / numeroAleatorio2;
  var inteiro = resultado.toInt();
  var decimal = resultado - inteiro;

  print("Numeros gerados: \n"
        "Numero 1: $numeroAleatorio1 \n"
        "Numero 2: $numeroAleatorio2 \n"
        "Resultado: $resultado \n"
        "Parte inteira: $inteiro \n"
        "Parte decimal: $decimal \n");
}