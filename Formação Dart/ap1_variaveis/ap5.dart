

void main() {
  var pessoa = Pessoa(nome: 'john', sobrenome: 'Reinert', idade: 20, ativo: true, peso: 90.1, nacionalidade: null);
  print(pessoa);
}

class Pessoa {
  final String nome;
  final String sobrenome ;
  int idade;
  bool ativo;
  double peso;
  String? nacionalidade;

  Pessoa({
    required this.nome,
    required this.sobrenome,
    required this.idade,
    required this.ativo,
    required this.peso,
    this.nacionalidade,
  });

  String verificarIdade() {
    if (idade < 18) {
      return ("(menor de idade)");
    } else {
      return ("(maior de idade)");
    }
  }

  @override
  String toString() {
    return "Nome completo: $nome $sobrenome\n"
        "Idade: $idade ${verificarIdade()}\n"
        "Situação: ${ativo ? 'Ativo' : 'Inativo'}\n"
        "Peso: $peso\n"
        "Nacionalidade: ${nacionalidade ?? 'Nao informada'}";
  }

}
