
void main() {
  // Variáveis opcional que armazenam dados da pessoa.
  String? nome = "John";
  String sobrenome = "Willans";
  int idade = 20;
  bool ativo = true;
  double peso = 90.1;
  String? nacionalidade = null;

  // Exibe o nome completo da pessoa.
  print("Nome completo: $nome $sobrenome");

  // Verifica se a pessoa é menor ou maior de idade.
  if (idade < 18) {
    print("Idade: $idade (menor de idade)");
  } else {
    print("Idade: $idade (maior de idade)");
  }

  // Verifica se a pessoa está ativa ou inativa.
  if (ativo) {
    print("Situação: Ativo");
  } else {
    print("Situação: Inativo");
  }

  // Exibe o peso da pessoa.
  print("Peso: $peso");

  // Verifica se a pessoa informou a nacionalidade.
  if (nacionalidade != null) {
    print("Nacionalidade: $nacionalidade");
  } else {
    print("Nacionalidade: Nao informada");
  }
}