class Retangulo {
  Retangulo(this.largura, this.altura);

  double largura;
  double altura;

  double calcularArea() => largura * altura;
}

void main() {
  Retangulo retangulo = Retangulo(4, 8);
  print("Area do retângulo: ${retangulo.calcularArea()}");
}
