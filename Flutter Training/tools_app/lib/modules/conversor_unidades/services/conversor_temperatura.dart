import 'conversor.dart';

class ConversorTemperatura extends Conversor {
  @override
  double converter(double valor, String origem, String destino) {
    if (origem == "Celsius" && destino == 'Fahrenheit') {
      return double.parse(((valor * 9 / 5) + 32).toStringAsFixed(2));
    } else if (origem == "Celsius" && destino == 'Kelvin') {
      return double.parse(((valor + 273.15).toStringAsFixed(2)));
    } else if (origem == "Fahrenheit" && destino == 'Celsius') {
      return double.parse((((valor - 32) * 5 / 9).toStringAsFixed(2)));
    } else if (origem == "Fahrenheit" && destino == 'Kelvin') {
      return double.parse(
        ((((valor - 32) * 5 / 9) + 273.15).toStringAsFixed(2)),
      );
    } else if (origem == "Kelvin" && destino == 'Celsius') {
      return double.parse(((valor - 273.15).toStringAsFixed(2)));
    } else if (origem == "Kelvin" && destino == 'Fahrenheit') {
      return double.parse(
        ((((valor - 273.15) * 9 / 5) + 32).toStringAsFixed(2)),
      );
    }
    return 0.0;
  }
}