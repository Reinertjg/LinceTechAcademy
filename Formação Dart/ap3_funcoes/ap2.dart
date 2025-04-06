import 'dart:math';

void main() {
  final funcaoAb = funcaoA(funcaoB);
  final funcaoAc = funcaoA(funcaoC);

  print("FuncaoA(B): $funcaoAb");
  print("FuncaoA(C): $funcaoAc");

}

int funcaoA(int Function(int) funcaoParametro) {
  final random = Random();

  final numero1 = funcaoParametro(random.nextInt(100));
  final numero2 = funcaoParametro(random.nextInt(100));
  final soma = numero1 * numero2;

  return soma;
}

int funcaoB(int valor) => valor * 2;

int funcaoC(int valor) => valor * 5;
