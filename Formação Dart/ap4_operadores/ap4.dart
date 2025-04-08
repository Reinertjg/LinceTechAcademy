
void main() {
  final valorSemDesconto = 10;
  final valorComDesconto = 7;

  // Imprime a mensagem do retorno da função
  print("Percentual do desconto: ${PercentualDesconto(valorSemDesconto, valorComDesconto)}");

}

// Função que calcula e retorna o percentual que o preço atual representa do valor original.
int PercentualDesconto(int valorSD, int valorCD) => (((valorSD - valorCD) * 100) ~/ valorSD);

