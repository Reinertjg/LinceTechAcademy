import 'dart:math';

void main() {
  List<int> listaAnos = [2016, 1988, 2000,  2100, 2300, 1993];

  for(int ano in listaAnos){
    print("O ano $ano ${ehAnoBissexto(ano)}");
  }
}

String ehAnoBissexto(int ano) {
  if (ano % 4 == 0)  {
    if (ano % 100 != 0 || ano % 400 == 0)
    return "Eh Bissexto";
  }
  return "Nao eh Bissexto";
}