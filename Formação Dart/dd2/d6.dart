import 'dart:collection';

void main() {
  Baralho baralho = Baralho();

  baralho.adicionarCarta(Carta('A', 'paus'));
  baralho.adicionarCarta(Carta('A', 'copas'));
  baralho.adicionarCarta(Carta('A', 'espadas'));
  baralho.adicionarCarta(Carta('A', 'ouros'));

  print('Baralho comeco');
  baralho.viewer();

  while (baralho.cartas.isNotEmpty) {
    baralho.removerCarta();
  }

  print('\nBaralho fim');
  baralho.viewer();
}


class Carta {
  final String valor;
  final String naipe;

  // Lista de naipes válidos
  static const List<String> naipesValidos = ['paus', 'copas', 'espadas', 'ouros'];

  Carta(this.valor, this.naipe) {
    if (!naipesValidos.contains(naipe.toLowerCase())) {
      throw ArgumentError('Naipe inválido: $naipe');
    }
  }

  @override
  String toString() {
    final simbolo = _obterSimboloNaipe(naipe);
    return '$valor de $naipe $simbolo';
  }

  String _obterSimboloNaipe(String naipe) {
    switch (naipe.toLowerCase()) {
      case 'paus':
        return '\u2663'; // ♣
      case 'copas':
        return '\u2665'; // ♥
      case 'espadas':
        return '\u2660'; // ♠
      case 'ouros':
        return '\u2666'; // ♦
      default:
        return '';
    }
  }
}

class Baralho {
  final Queue<Carta> cartas = Queue<Carta>();

  void viewer() => print(cartas);

  // Adiciona uma carta no topo do baralho
  void adicionarCarta(Carta carta) => cartas.addFirst(carta);

  // Remove a carta do topo do baralho
  void removerCarta() {
    if (cartas.isEmpty) {
      print('Baralho vazio');
      return;
    }
    var removida = cartas.removeFirst();
    print('Carta removida: $removida');
  }
}

