void main() {
  // Criação de uma instância da classe Pessoa com os atributos fornecidos.
  var pessoa = Pessoa(
    nome: 'john',
    sobrenome: 'Reinert',
    idade: 20,
    ativo: true,
    peso: 90.1,
    nacionalidade: null,
  );

  // Impressão da representação textual do objeto Pessoa.
  print(pessoa);
}

/// Classe que representa uma pessoa com atributos básicos e métodos utilitários.
class Pessoa {
  final String nome;
  final String sobrenome;

  int idade;
  bool ativo;
  double peso;
  String? nacionalidade;

  ///  Construtor nomeado que exige os campos obrigatórios e permite nacionalidade opcional.
  Pessoa({
    required this.nome,
    required this.sobrenome,
    required this.idade,
    required this.ativo,
    required this.peso,
    this.nacionalidade,
  });

  /// Método que verifica se a pessoa é maior ou menor de idade com base no valor de [idade].
  ///
  /// Retorna uma string indicando a condição da idade.
  String verificarIdade() {
    if (idade < 18) {
      return ("(menor de idade)");
    } else {
      return ("(maior de idade)");
    }
  }

  /// Sobrescrita do método [toString] para retornar uma representação textual detalhada do objeto.
  @override
  String toString() {
    return "Nome completo: $nome $sobrenome\n"
        "Idade: $idade ${verificarIdade()}\n"
        "Situação: ${ativo ? 'Ativo' : 'Inativo'}\n"
        "Peso: $peso\n"
        "Nacionalidade: ${nacionalidade ?? 'Nao informada'}";
  }
}
