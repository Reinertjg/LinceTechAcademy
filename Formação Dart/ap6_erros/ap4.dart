
void main() {
  try {
    // Definindo um nome arbitrário para o arquivo
    final nomeArquivo = 'bloco.txt';

    ArquivoTexto arquivoTexto = ArquivoTexto(nomeArquivo);
    arquivoTexto.abrir();
  } catch (e) {
    // Imprimir mensagem de erro
    print(e);
  } finally {
    print("Fim do programa");
  }
}

// Interface abstrata chamada Arquivo
// Toda classe que implementar essa interface deve implementar o metodo abrir()
abstract class Arquivo {
  void abrir();
}

// Classe que implementa a interface Arquivo
class ArquivoTexto implements Arquivo {
  // Construtor que recebe o nome do arquivo
  ArquivoTexto(this.nome);

  // Atributo final (imutável) com o nome do arquivo
  final String nome;

  // Implementação do metodo abrir
  @override
  void abrir() {
    try {
      throw Exception("Erro ao abrir o arquivo $nome");
    } catch (e) {
      print('Relançar a exception');
      rethrow;
    }
  }
}
