import 'conversor.dart';

class ConversorPeso extends Conversor {
  @override
  double converter(double valor, String origem, String destino) {
    if (origem == "Kg" && destino == 'g') {
      return valor * 1000;
    } else if (origem == "Kg" && destino == 'mg') {
      return valor * 1000000;
    } else if (origem == "g" && destino == 'Kg') {
      return valor / 1000;
    } else if (origem == "g" && destino == 'mg') {
      return valor * 1000;
    } else if (origem == "mg" && destino == 'Kg') {
      return valor / 1000000;
    } else if (origem == "mg" && destino == 'g') {
      return valor / 1000;
    }
    return 0.0;
  }
}