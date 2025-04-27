void main() {
  buscarDados();
}

Future<void> buscarDados() async {
  print("Iniciando busca de dados.");

  print("Buscando dados...");
  await Future.delayed(Duration(seconds: 5));

  print("Dados encontrados com sucesso.");
}
