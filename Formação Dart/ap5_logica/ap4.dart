void main() {
  final listaNomes = [
    "Joao",
    "Maria",
    "Pedro",
    "Maria",
    "Ana",
    "Joao",
    "Maria",
    "Fernanda",
    "Carlos",
    "Maria"
  ];

  final nome = 'Joao';
  final quantidade = contarNome(listaNomes, nome);

  if (quantidade == 1) {
    print('O nome $nome foi encontrado 1 vez');
  } else if (quantidade > 0) {
    print('O nome $nome foi encontrado $quantidade vezes');
  } else {
    print('O nome nao foi encontrado');
  }
}

// Funcao que recebe um nome String e filtra o elemento da lista que atendem à condição fornecida.
// Retornando o número de elementos no resultado filtrado
int contarNome(List<String> listaNomes, String nome) {
  return listaNomes.where((nomeIndex) => nomeIndex == nome).length;
}