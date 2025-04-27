import 'dart:math';

void main() {
  List<double> raios = [5, 8, 12, 7.3, 18, 2, 25];

  for (var raio in raios) {
    print(
      "Raio: $raio, area: ${calcularArea(raio).toStringAsFixed(2)}, perímetro: ${calcularPerimetro(raio).toStringAsFixed(2)}.",
    );
  }
}

double calcularArea(double raio) => pi * (raio * raio);

double calcularPerimetro(double raio) => 2 * pi * raio;
