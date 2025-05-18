import 'dart:collection';
import 'dart:math';

void main() {
  Fila fila = Fila();

  print('-----------Fila-----------');
  fila.adicionarPessoaFila(10);

  print('\n--------Atendimentos--------');
  while (fila.fila.length > 0) {
    fila.atenderPessoa();
  }
}

class Fila {
  final Queue<String> fila = Queue<String>();

  // Adiciona uma carta no topo do baralho
  void adicionarPessoaFila(int qtdPessoa) {
    for (int i = 0; i < qtdPessoa; i++) {
      String pessoaNome = Pessoa.gerarNomeAleatorio(); // Gera novo nome a cada loop
      fila.addLast(pessoaNome);
      print('($pessoaNome) entrou na fila');
    }
  }

  // Remove a carta do topo do baralho
  void atenderPessoa() {
    if (fila.isEmpty) {
      print('Fila vazia');
      return;
    }
    var removida = fila.removeFirst();
    print('($removida) foi atendido(a)');
  }
}

class Pessoa {
  static String gerarNomeAleatorio() {
    var random = Random();

    List<String> nomes = [
      'Ana',
      'Francisco',
      'Joao',
      'Pedro',
      'Gabriel',
      'Rafaela',
      'Marcio',
      'Jose',
      'Carlos',
      'Patricia',
      'Helena',
      'Camila',
      'Mateus',
      'Gabriel',
      'Maria',
      'Samuel',
      'Karina',
      'Antonio',
      'Daniel',
      'Joel',
      'Cristiana',
      'Sebastiao',
      'Paula',
    ];

    List<String> sobrenomes = [
      'Silva',
      'Ferreira',
      'Almeida',
      'Azevedo',
      'Braga',
      'Barros',
      'Campos',
      'Cardoso',
      'Teixeira',
      'Costa',
      'Santos',
      'Rodrigues',
      'Souza',
      'Alves',
      'Pereira',
      'Lima',
      'Gomes',
      'Ribeiro',
      'Carvalho',
      'Lopes',
      'Barbosa',
    ];

    return "${nomes[random.nextInt(nomes.length)]} ${sobrenomes[random.nextInt(sobrenomes.length)]}";
  }
}
