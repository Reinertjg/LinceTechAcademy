
void main() {
  String? nome = "John";
  String sobrenome = "Willans";
  int idade = 20;
  bool ativo = true;
  double peso = 90.1;
  String? nacionalidade = null;

  print("Nome completo: $nome $sobrenome");

  if (idade < 18) {
    print("Idade: $idade (menor de idade)");
  } else {
    print("Idade: $idade (maior de idade)");
  }

  if (ativo) {
    print("Situação: Ativo");
  } else {
    print("Situação: Inativo");
  }

  print("Peso: $peso");

  if (nacionalidade != null) {
    print("Nacionalidade: $nacionalidade");
  } else {
    print("Nacionalidade: Nao informada");
  }
}