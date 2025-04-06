import 'dart:math';

void main() {
  final random = Random();
  List<int> listaRaios = List.generate(10, (_) =>  random.nextInt(100));

  for (int i = 0; i < listaRaios.length; i++) {
    var area = calcularArea(listaRaios[i]);
    var perimetro = calcularPerimetro(listaRaios[i]);

    print("Raio: ${listaRaios[i]}, "
        "area: ${area.toStringAsFixed(2)}, "
        "perímetro: ${perimetro.toStringAsFixed(2)}.");
  }
}

double calcularArea(int raio) => pi * pow(raio, 2);

double calcularPerimetro(int raio) => 2 * pi * raio;
