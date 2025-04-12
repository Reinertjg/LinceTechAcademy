import 'dart:math';

void main() {
  var random = Random();

  try {
    // Gera dois números aleatórios entre 0 e 99 (com casas decimais)
    // e tenta criar um objeto Retângulo com esses valores
    Retangulo retangulo = Retangulo(random.nextDouble() * 99, random.nextDouble() * 99);

    // Chama o metodo calcularArea() e guarda o resultado
    double resultado = retangulo.calcularArea();

    // Imprime a área formatada com 2 casas decimais
    print("Area do retângulo: ${resultado.toStringAsFixed(2)}");
  } catch (e) {
    // Caso ocorra alguma exceção (ex: base ou altura <= 0), imprime o erro
    print('Erro: $e');
  }
}

// Define uma interface abstrata chamada Forma
// Toda classe que implementar Forma precisa ter um metodo calcularArea()
abstract class Forma {
  double calcularArea();
}

// Classe Retangulo que implementa a interface Forma
class Retangulo implements Forma {

  // Atributos privados da classe, _ priva
  double? _base;
  double? _altura;

  // Construtor da classe que recebe base e altura como parâmetros
  // Valida se os valores são maiores que zero
  Retangulo(double base, double altura) {
    if (base <= 0 || altura <= 0) {
      throw Exception('Dimensões inválidas');
    }

    // Atribui os valores aos atributos privados
    _base = base;
    _altura = altura;


  }

  // Implementação do metodo calcularArea da interface Forma
  @override
  double calcularArea() {
    // Retorna a multiplicação entre base e altura (área do retângulo)
    return _base! * _altura!;
  }


}



