
void main() {
  List<double> temperaturaC = [0.0, 4.2, 15.0, 18.1, 21.7, 32.0, 40.0, 41.0];

  for (var temp in temperaturaC) {
    print(
      "Celsius: $temp, fahrenheit: ${celsiusToFah(temp).toStringAsFixed(2)}, kelvin: ${celsiusToKel(temp).toStringAsFixed(2)}  ",
    );
  }
}

double celsiusToFah(double temp) => (temp * 1.8) + 32;

double celsiusToKel(double temp) => temp + 273.15;
