void main() {
  String paragrafo =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
      "Nam venenatis nunc et posuere vehicula. Mauris lobortis quam id lacinia porttitor.";

  print(
      "Numero de palavras: ${paragrafo.split(" ").length} \n"
      "Tamanho do texto: ${paragrafo.length} \n"
      "Numero de frases: ${paragrafo.split(".").length-1} \n"
      "Numero de vogais: ${contagemVogais(paragrafo)} \n"
      "Consoantes encontradas: ${contagemConsoantes(paragrafo)}"
  );

}

int contagemVogais(String texto) {
  List<String> vogais = ['a', 'e', 'i', 'o', 'u'];
  int contador = 0;

  for (int i = 0; i < texto.length; i++) {
    if (vogais.contains(texto[i])) {
      contador++;
    }
  }
  return contador;
}

List<String> contagemConsoantes(String texto) {
  List<String> consoantes = ['b', 'c', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'm', 'n', 'p', 'q', 'r', 's', 't', 'v', 'w', 'x', 'y', 'z'];
  List<String> listaTexto = [];

  for (int i = 0; i < texto.length; i++) {
    if (consoantes.contains(texto[i]) && !listaTexto.contains(texto[i])) {
      listaTexto.add(texto[i]);
    }
  }
  return listaTexto;
}
