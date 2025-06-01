import 'conversor.dart';

class ConversorDistancia extends Conversor {
  @override
  double converter(double valor, String origem, String destino) {
    if (origem == "Km" && destino == 'm') {
      return valor * 1000;
    } else if (origem == "Km" && destino == 'cm') {
      return valor * 100000;
    } else if (origem == "m" && destino == 'Km') {
      return valor / 1000;
    } else if (origem == "m" && destino == 'cm') {
      return valor * 100;
    } else if (origem == "cm" && destino == 'Km') {
      return valor / 100000;
    } else if (origem == "cm" && destino == 'm') {
      return valor / 100;
    }
    return 0.0;
  }
}