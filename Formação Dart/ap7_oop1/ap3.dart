class Produto  {
  String nome = '';
  double preco = 0.0;

  double calcularDesconto(double desconto) => preco - (preco * (desconto / 100));
}

void main() {
  final produtosDesconto = <Produto>[];
  List nomes = ['Lapis', 'Caderno', 'Controle', 'Vaso', 'Mochila'];
  List precos = [3.0, 10.0, 75.0, 25.0, 100.0];

  for(int i = 0; i < 5; i++) {

    final produto = Produto();
    produto.nome = nomes[i];
    produto.preco = precos[i];

    final precoNovo = produto.calcularDesconto(5.0);

    produtosDesconto.add(produto);

    print("Novo preço do produto ${produtosDesconto[i].nome} (com desconto): $precoNovo\n");

  }
}
