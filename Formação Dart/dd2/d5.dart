import 'dart:math';

void main() {
  List<ItemDeCompra> itens = [
    ItemDeCompra('Escova', 1, Status.comprado),
    ItemDeCompra('Sabonete', 2, Status.pendente),
    ItemDeCompra('Shampoo', 1, Status.semEstoque),
    ItemDeCompra('Creme Dental', 1, Status.pendente),
    ItemDeCompra('Desodorante', 2, Status.comprado),
    ItemDeCompra('Papel Higiênico', 4, Status.pendente),
    ItemDeCompra('Detergente', 3, Status.semEstoque),
    ItemDeCompra('Esponja', 2, Status.pendente),
    ItemDeCompra('Água Sanitária', 1, Status.comprado),
    ItemDeCompra('Amaciante', 2, Status.pendente),
  ];

  // Instancia a lista de compras
  ListaDeCompras listaDeCompras = ListaDeCompras();

  // Adiciona os itens
  listaDeCompras.adicionar(itens);

  // Exibe todos os itens adicionados
  print('--- Lista de Compras ---');
  print(listaDeCompras.tudo());

  // Marca dois como comprados
  listaDeCompras.marcarComprado('Escova');
  listaDeCompras.marcarComprado('Creme Dental');

  // Marca um como sem estoque
  listaDeCompras.marcarSemEstoque('Desodorante');

  // Exibe pendentes
  print('--- Itens Pendentes ---');
  print(listaDeCompras.pendentes);

  // Exibe progresso
  print('--- Progresso ---');
  print('Progresso: ${listaDeCompras.progresso()}\n');

  // Tenta escolher um pendente aleatoriamente
  try {
    print('--- Item aleatório pendente ---');
    print(listaDeCompras.escolherAleatorioPendente());
  } catch (e) {
    print('Nenhum item pendente disponível para sorteio.');
  }
}

enum Status { pendente, comprado, semEstoque }

class ItemDeCompra {
  ItemDeCompra(this.nome, this.quantidade, this.status);

  String nome;
  int quantidade;
  Status status;

  @override
  String toString() {
    return 'Item: $nome, Quantidade: $quantidade, Status: $status \n';
  }
}

// Classe que possui todas as acoes
class ListaDeCompras {
  final List<ItemDeCompra> _itens = [];

  // Lista interna que armazena os itens de compra
  List<ItemDeCompra> tudo() => _itens;

  // Adiciona uma lista de itens à lista interna
  void adicionar(List<ItemDeCompra> itens) {
      _itens.addAll(itens);
  }

  // Marca um item como comprado a partir do nome
  void marcarComprado(String nomeItem) {
    try {
      var itemEncontrado = _itens.firstWhere((e) => e.nome == nomeItem);
      itemEncontrado.status = Status.comprado;
    } catch (e) {
      print('Produto nao encontrado');
    }
  }

  // Marca um item como sem estoque a partir do nome
  void marcarSemEstoque(String nomeItem) {
    try {
      var itemEncontrado = _itens.firstWhere((e) => e.nome == nomeItem);
      itemEncontrado.status = Status.semEstoque;
    } catch (e) {
      print('Produto nao encontrado');
    }
  }

  // Retorna uma lista dos itens que ainda estão pendentes
  List<ItemDeCompra> get pendentes =>
      _itens.where((e) => e.status == Status.pendente).toList();

  // Escolhe aleatoriamente um item que esteja pendente
  ItemDeCompra escolherAleatorioPendente() {
    var random = Random().nextInt(pendentes.length);
    return pendentes[random];
  }

  // Retorna a quantidade de itens que já foram comprados
  int get comprados =>
      _itens.where((e) => e.status == Status.comprado,).toList().length;

  // Retorna uma string indicando o progresso da compra (comprados/total)
  String progresso() => '${comprados}/${_itens.length}';


}
