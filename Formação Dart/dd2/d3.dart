
void main() {
  BibliotecaMusical biblioteca = BibliotecaMusical();

  // Lista de tipo Musica com todas as musicas.
  List<Musica> musicas = [
    Musica('Shape of You', 'Ed Sheeran', 'Divide', 240),
    Musica('Bohemian Rhapsody', 'Queen', 'A Night at the Opera', 354),
    Musica('Billie Jean', 'Michael Jackson', 'Thriller', 293),
    Musica('Imagine', 'John Lennon', 'Imagine', 183),
    Musica('Smells Like Teen Spirit', 'Nirvana', 'Nevermind', 301),
    Musica('Hotel California', 'Eagles', 'Hotel California', 391),
    Musica('Hey Jude', 'The Beatles', 'Single', 431),
    Musica('Rolling in the Deep', 'Adele', '21', 228),
  ];

  // Adiciona todas as músicas à biblioteca
  biblioteca.adicionarMusica(musicas);

  // Metodos de exibicao
  biblioteca.exibirMusica();
  biblioteca.exibirNumeroMusica();

  // Metodos de busca
  biblioteca.buscarPorTitulo('Shape of You');
  biblioteca.buscarPorArtista('The Beatles');
  biblioteca.buscarPorAlbum('Imagine');
}


class Musica {
  String titulo;
  String artista;
  String album;
  int duracaoSegundos;

  Musica(this.titulo, this.artista, this.album, this.duracaoSegundos);
}

class BibliotecaMusical {
  List<Musica> musicas = [];

  void adicionarMusica(List<Musica> listaMusica) {
    musicas.addAll(listaMusica);
  }

  void exibirMusica() {
    int i = 1;
    for(var linha in musicas){
      print("=========== MUSICA $i ==============");
      print("Titulo: ${linha.titulo}");
      print("Artista: ${linha.artista}");
      print("Album: ${linha.album}");
      print("Duracao: ${converterParaHora(linha.duracaoSegundos).toStringAsFixed(2)} Horas");
      i++;
    }
  }

  void exibirNumeroMusica() {
    final numeroTotal = musicas.map((e) => e.titulo).length;
    print("=========== NUMERO TOTAL ==============");
    print("=> $numeroTotal Musicas");
  }

  double converterParaHora(int segundos) => segundos / 3600;

  void buscarPorTitulo(String titulo) {
    final musicaPorTitulo = musicas.where((musica) => musica.titulo == titulo);
    if(musicaPorTitulo.isEmpty) {
      print("Nao ha musica com este titulo");
    }
    for(var linha in musicaPorTitulo){
      print("=========== BUSCADA POR TITULO ==============");
      print("\x1B[1mTitulo: ${linha.titulo}\x1B[0m");
      print("Artista: ${linha.artista}");
      print("Album: ${linha.album}");
      print("Duracao: ${converterParaHora(linha.duracaoSegundos).toStringAsFixed(2)} Horas");
    }
  }

  void buscarPorArtista(String artista) {
    final musicaPorArtista = musicas.where((musica) => musica.artista == artista);
    if(musicaPorArtista.isEmpty) {
      print("Nao ha musica com este artista");
    }
    for(var linha in musicaPorArtista){
      print("=========== BUSCADA POR ARTISTA ==============");
      print("Titulo: ${linha.titulo}");
      print("\x1B[1mArtista: ${linha.artista}\x1B[0m");
      print("Album: ${linha.album}");
      print("Duracao: ${converterParaHora(linha.duracaoSegundos).toStringAsFixed(2)} Horas");
    }
  }

  void buscarPorAlbum(String album) {
    final musicaPorAlbum = musicas.where((musica) => musica.album == album);
    if(musicaPorAlbum.isEmpty) {
      print("Nao ha musica com este album");
    }
    for(var linha in musicaPorAlbum){
      print("=========== BUSCADA POR ALBUM ==============");
      print("Titulo: ${linha.titulo}");
      print("Artista: ${linha.artista}");
      print("\x1B[1mAlbum: ${linha.album}\x1B[0m");
      print("Duracao: ${converterParaHora(linha.duracaoSegundos).toStringAsFixed(2)} Horas");
    }
  }

  // Falta criar os outros metodos buscarPorArtista, buscarPorAlbum
  // Tambem realizar a validacao nestes metodos de busca, se for nulo
  // Melhorar visualmente a impressao no terminal.

  }