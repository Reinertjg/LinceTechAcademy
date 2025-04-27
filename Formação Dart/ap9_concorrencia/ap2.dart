Future<void> main() async {
  List<String> urls = [
    'https://example.com/imagem1.jpg',
    'https://example.com/imagem2.jpg',
    'https://example.com/imagem3.jpg',
  ];

  await baixarImagens(urls);
}

Future<void> baixarImagens(List<String> urls) async {
  print("Baixando imagens...");

  for (String linha in urls) {
    await downloadImage(linha);
  }

  print("Download concluído!");
}

Future<void> downloadImage(String url) async {
  await Future.delayed(Duration(seconds: 2));

  // Simula Download

  print("Imagem <$url> baixada com sucesso!");
}
