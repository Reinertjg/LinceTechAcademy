import 'dart:math';

void main() {
  Album album = Album();
  int totalPacotes = 0;

  while (!album.verificarCompleto()) {
    PacoteDeFiguras pacote = PacoteDeFiguras();
    List<Figura> novas = pacote.pacoteSorte();
    album.colar(novas);
    totalPacotes++;
  }

  print('\nAlbum completo com $totalPacotes pacotes!');
  print('Total de figurinhas repetidas: ${album.repetidas.length}\n');

  album.viewAlbum();
}

class Figura {
  Figura(this.codigo, this.nome);

  int codigo;
  String nome;

  static List<Figura> allFigurinhas = [
    Figura(1, 'Mascote da Copa'),
    Figura(2, 'Logo da Copa'),
    Figura(3, 'Estádio Abertura'),
    Figura(4, 'Estádio Final'),
    Figura(5, 'Bola Oficial'),
    Figura(6, 'Troféu da Copa'),
    Figura(7, 'Craque do Brasil'),
    Figura(8, 'Craque da Argentina'),
    Figura(9, 'Craque da França'),
    Figura(10, 'Craque da Alemanha'),
    Figura(11, 'Seleção do Brasil'),
    Figura(12, 'Seleção da Espanha'),
    Figura(13, 'Seleção de Portugal'),
    Figura(14, 'Seleção do Japão'),
    Figura(15, 'Torcida Brasileira'),
    Figura(16, 'Torcida Internacional'),
    Figura(17, 'Gol Histórico'),
    Figura(18, 'Jogada Inesquecível'),
    Figura(19, 'Camisa Oficial'),
    Figura(20, 'Chaveamento Final'),
  ];
}

class PacoteDeFiguras {
  Random random = Random();

  List<Figura> pacoteSorte() {
    List<Figura> figurasSorteadas = [];
    for (int i = 0; i < 4; i++) {
      figurasSorteadas.add(
        Figura.allFigurinhas[random.nextInt(Figura.allFigurinhas.length)],
      );
    }
    return figurasSorteadas;
  }
}

class Album {
  final Set<Figura> albumFigura = {};
  final List<Figura> repetidas = [];

  void colar(List<Figura> figurinhasNovas) {
      for (var item in figurinhasNovas) {
        if (!albumFigura.contains(item)) {
          albumFigura.add(item);
        } else {
          repetidas.add(item);
        }
    }
  }

  bool verificarCompleto() {
    return albumFigura.length == Figura.allFigurinhas.length;
  }

  void viewAlbum() {
    final figurasOrdenadas =
        albumFigura.toList()..sort((a, b) => a.codigo.compareTo(b.codigo));

    for (var figura in figurasOrdenadas) {
      print('Codigo: ${figura.codigo}, Nome: ${figura.nome}');
    }
  }
}
