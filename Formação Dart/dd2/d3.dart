
void main() {
  BibliotecaMusical biblioteca = BibliotecaMusical();

  Musica musica1 = Musica('Shape of You', 'Ed Sheeran', 'Divide', 240);
  Musica musica2 = Musica('Bohemian Rhapsody', 'Queen', 'A Night at the Opera', 354);

  biblioteca.adicionarMusica(musica1);
  biblioteca.adicionarMusica(musica2);
  biblioteca.exibirMusica();
  biblioteca.exibirNumeroMusica();
  biblioteca.sistemaBusca();
}


class Musica {
  String titulo;
  String artista;
  String album;
  int duracaoSegundos;

  Musica(this.titulo, this.album, this.artista, this.duracaoSegundos);
}

class BibliotecaMusical {
  List<Musica> musicas = [];

  void adicionarMusica(Musica musica) {
    musicas.add(musica);
  }

  void exibirMusica() {
    for(var linha in musicas){
      print("=========== MUSICA ==============");
      print("Titulo: ${linha.titulo}");
      print("Artista: ${linha.artista}");
      print("Album: ${linha.album}");
      print("Duracao: ${converterParaHora(linha.duracaoSegundos).toStringAsFixed(2)} Horas \n");
    }
  }

  void exibirNumeroMusica() {
    final numeroTotal = musicas.map((e) => e.titulo).length;
    print("Numero total: $numeroTotal Musicas");
  }

  double converterParaHora(int segundos) => segundos / 3600;

  void sistemaBusca() {
    final musicaPorTitulo = musicas.where((musica) => musica.titulo == 'Bohemian Rhapsody');
    for(var linha in musicaPorTitulo){
      print("=========== BUSCADA POR TITULO ==============");
      print("Titulo: ${linha.titulo}");
      print("Artista: ${linha.artista}");
      print("Album: ${linha.album}");
      print("Duracao: ${converterParaHora(linha.duracaoSegundos).toStringAsFixed(2)} Horas \n");
    }
  }

  // Falta criar os outros metodos buscarPorArtista, buscarPorAlbum
  // Tambem realizar a validacao nestes metodos de busca, se for nulo
  // Melhorar visualmente a impressao no terminal.

  }