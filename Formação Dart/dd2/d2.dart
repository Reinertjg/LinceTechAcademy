import 'dart:math';

void main() {
   final fornecedores = [
    FornecedorDeBebidas(),
    FornecedorDeBolos(),
    FornecedorDeSaladas(),
    FornecedorDePetiscos(),
  ];

  final pessoa = Pessoa();
  final random = Random();
  final fornecedorAleatorio = fornecedores[random.nextInt(fornecedores.length)];

  // Consumindo produtos fornecidos
  for (var i = 0; i < 6;   i++) {
    if (!pessoa.precisaComer()) {
      print("Nao precisa comer!!");
      continue;
    }
    pessoa.refeicao(fornecedorAleatorio);
  }

  pessoa.informacoes();
}

class Produto {
  Produto(this.nome, this.calorias);

  /// Nome deste produto
  final String nome;

  /// Total de calorias
  final int calorias;
}

abstract class Fornecedor {
  Produto fornecer();
}

class FornecedorDeBebidas implements Fornecedor {
  final _random = Random();
  final _bebidasDisponiveis = <Produto>[
    Produto('Agua', 0),
    Produto('Refrigerante', 200),
    Produto('Suco de fruta', 100),
    Produto('Energetico', 135),
    Produto('Cafe', 60),
    Produto('Cha', 35),
  ];

  /// Retorna um produto que pode ser consumido por um consumidor
  Produto fornecer() {
    return _bebidasDisponiveis[_random.nextInt(_bebidasDisponiveis.length)];
  }
}

class FornecedorDeSanduiches implements Fornecedor {
  final _random = Random();
  final _sanduichesDisponiveis = <Produto>[
    Produto('Sanduíche natural de frango', 180),
    Produto('Sanduíche de atum light', 160),
    Produto('Sanduíche vegetariano', 140),
    Produto('Sanduíche de queijo minas', 150),
    Produto('Sanduíche de peito de peru', 170),
    Produto('Sanduíche de salmão defumado', 190),
  ];

  /// Retorna um produto que pode ser consumido por um consumidor
  Produto fornecer() {
    return _sanduichesDisponiveis[_random.nextInt(_sanduichesDisponiveis.length)];
  }
}

class FornecedorDeBolos implements Fornecedor {
  final _random = Random();
  final _bolosDisponiveis = <Produto>[
    Produto('Bolo de fubá simples', 130),
    Produto('Bolo de laranja sem cobertura', 150),
    Produto('Bolo de banana integral', 170),
    Produto('Bolo de maçã com aveia', 160),
    Produto('Bolo de chocolate amargo', 190),
    Produto('Bolo de cenoura leve', 180),
  ];

  /// Retorna um produto que pode ser consumido por um consumidor
  Produto fornecer() {
    return _bolosDisponiveis[_random.nextInt(_bolosDisponiveis.length)];

  }
}

class FornecedorDeSaladas implements Fornecedor {
  final _random = Random();
  final _saladasDisponiveis = <Produto>[
    Produto('Salada verde simples', 50),
    Produto('Salada de tomate com manjericão', 60),
    Produto('Salada de pepino', 40),
    Produto('Salada de rúcula com parmesão', 80),
    Produto('Salada de frutas frescas', 90),
    Produto('Salada de cenoura ralada', 70),
  ];

  Produto fornecer() {
    return _saladasDisponiveis[_random.nextInt(_saladasDisponiveis.length)];
  }
}

class FornecedorDePetiscos implements Fornecedor {
  final _random = Random();
  final _petiscosDisponiveis = <Produto>[
    Produto('Espetinho de queijo coalho', 180),
    Produto('Mini wrap de frango', 160),
    Produto('Palitinhos de legumes com molho', 120),
    Produto('Chips de batata doce assada', 140),
    Produto('Mini hambúrguer de frango', 190),
    Produto('Amêndoas temperadas', 170),
  ];

  Produto fornecer() {
    return _petiscosDisponiveis[_random.nextInt(_petiscosDisponiveis.length)];
  }
}

enum StatusCal {
  deficitExtremo,
  deficit,
  satisfeito,
  excesso,
}


class Pessoa {
  static final random = Random();
  // Acumulador de calorias
  int _caloriasIniciais = random.nextInt(3000); // exemplo de calorias iniciais
  int quantidadeRefeicoes = 0;


  StatusCal status(){
    if(_caloriasIniciais <= 500) {
      return StatusCal.deficitExtremo;
    } else if (_caloriasIniciais <= 1800) {
      return StatusCal.deficit;
    } else if (_caloriasIniciais <= 2500) {
      return StatusCal.satisfeito;
    } else if (_caloriasIniciais > 2500) {
      return StatusCal.excesso;
    }
    return StatusCal.deficit;
  }

  bool precisaComer() {
    StatusCal statusAtual = status();
    return statusAtual == StatusCal.deficitExtremo || statusAtual == StatusCal.deficit;  }

  /// Imprime as informacoes desse consumidor
  void informacoes() {
    StatusCal statusAtual = status();

    print('Calorias consumidas: $_caloriasIniciais');
    print("Status Calorico: ${statusAtual.name} ");
    print("Refeicoes realizadas: $quantidadeRefeicoes");
  }

  /// Consome um produto e aumenta o número de calorias
  void refeicao(Fornecedor fornecedor) {

    final produto = fornecedor.fornecer();
      print('Consumindo ${produto.nome} (${produto.calorias} calorias)');
      quantidadeRefeicoes++;
    }
  }



/*
 Refatoração de programas, iniciante
IMPORTANTE: para a realização desse exercício, nao deve ser utilizado dynamic.

Objetivo do programa: fazer a simulação de uma pessoa que consome calorias provenientes de produtos, os produtos sao fornecidos por fornecedores.

Considerando o objetivo do programa, efetue uma refatoração utilizando os conceitos de orientação a objetos, completando os requisitos especificados abaixo, utilizando comentários para demarcar no código onde os objetivos foram atingidos.

1. Criar novos fornecedores: sanduíches, bolos, saladas, petiscos, ultra-calóricos
2. Alterar o programa para escolher um novo fornecedor aleatoriamente para cada "refeição"
3. Nas informações da pessoa, adicione uma lógica "status" do nível de calorias (dica: utilizar um enum)
  1. Calorias <= 500 : Deficit extremo de calorias;
  2. 500 > Calorias <= 1800 : Deficit de calorias;
  3. 1800 > Calorias <= 2500 : Pessoa está satisfeita;
  4. Calorias > 2500 : Excesso de calorias;
5. Altere o programa para definir um nível inicial de calorias aleatoriamente ao instanciar uma pessoa;
6. Altere o programa para se basear no nível de calorias para definir se a pessoa precisa de refeições

Imprima o número de refeições realizadas nas informações da pessoa;

 */