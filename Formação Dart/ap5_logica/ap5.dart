import 'dart:math';

void main() {
  final random = Random();
  final opcao = random.nextInt(6);

  // Utiliza uma expressão switch para determinar a mensagem baseada no valor de 'opcao'
  final mensagem = switch (opcao){
    1 => 'Encontrado 1',
    2 => 'Encontrado 2',
    3 => 'Encontrado 3',
    4 => 'Encontrado 4',
    5 => 'Encontrado 5',
    _ => "Opcao invalida"
  };

  // Exibe a mensagem resultante
  print(mensagem);
}
