import 'dart:math' as math;

void main() {
  final comparador = ComparadorFormasGeometricas();

  final forma1 = Circulo('Circulo A', 3);
  final forma2 = Retangulo('Retângulo B', 19, 11);
  final forma3 = HexagonoRegular('Hexágono', 7);
  final forma4 = TrianguloRetangulo('Triângulo Retângulo', 3, 4);

  final maiorArea = comparador.maiorArea(forma1, forma2);
  final maiorPerimetro = comparador.maiorPerimetro(forma3, forma4);

  print(
    'A maior área é ${maiorArea.area.toStringAsFixed(2)} e pertence a ${maiorArea.nome}',
  );
  print(
    'O maior perímetro é ${maiorPerimetro.perimetro.toStringAsFixed(2)} e pertence a ${maiorPerimetro.nome}',
  );
}

/// Classe base abstrata para todas as formas geométricas
abstract class FormaGeometrica {
  final String nome;

  FormaGeometrica(this.nome);

  double get area;
  double get perimetro;
}

/// Implementação da classe Circulo com herança
class Circulo extends FormaGeometrica {
  final double raio;

  Circulo(String nome, this.raio) : super(nome);

  @override
  double get area => math.pi * math.pow(raio, 2);

  @override
  double get perimetro => 2 * math.pi * raio;
}

/// Implementação da classe Retangulo com herança
class Retangulo extends FormaGeometrica {
  final double altura;
  final double largura;

  Retangulo(String nome, this.altura, this.largura) : super(nome);

  @override
  double get area => altura * largura;

  @override
  double get perimetro => 2 * (altura + largura);
}

/// Implementação da classe Quadrado com herança
class Quadrado extends FormaGeometrica {
  final double lado;

  Quadrado(String nome, this.lado) : super(nome);

  @override
  double get area => lado * lado;

  @override
  double get perimetro => 4 * lado;
}

/// Implementação da classe Triangulo Equilátero com herança
class TrianguloEquilatero extends FormaGeometrica {
  final double lado;

  TrianguloEquilatero(String nome, this.lado) : super(nome);

  @override
  double get area => (math.pow(3, 0.5) / 4) * math.pow(lado, 2);

  @override
  double get perimetro => 3 * lado;
}

/// Implementação da classe Triangulo Retângulo com herança
class TrianguloRetangulo extends FormaGeometrica {
  final double cateto1;
  final double cateto2;

  TrianguloRetangulo(String nome, this.cateto1, this.cateto2) : super(nome);

  @override
  double get area => (cateto1 * cateto2) / 2;

  @override
  double get perimetro => cateto1 + cateto2 + math.sqrt(cateto1 * cateto1 + cateto2 * cateto2);
}

/// Implementação da classe Pentágono Regular com herança
class PentagonoRegular extends FormaGeometrica {
  final double lado;

  PentagonoRegular(String nome, this.lado) : super(nome);

  @override
  double get area => (5 * lado * lado) / (4 * math.tan(math.pi / 5));

  @override
  double get perimetro => 5 * lado;
}

/// Implementação da classe Hexágono Regular com herança
class HexagonoRegular extends FormaGeometrica {
  final double lado;

  HexagonoRegular(String nome, this.lado) : super(nome);

  @override
  double get area => (3 * math.sqrt(3) * lado * lado) / 2;

  @override
  double get perimetro => 6 * lado;
}

/// Comparador utilizando polimorfismo
class ComparadorFormasGeometricas {
  FormaGeometrica maiorArea(FormaGeometrica a, FormaGeometrica b) {
    return a.area >= b.area ? a : b;
  }

  FormaGeometrica maiorPerimetro(FormaGeometrica a, FormaGeometrica b) {
    return a.perimetro >= b.perimetro ? a : b;
  }
}


