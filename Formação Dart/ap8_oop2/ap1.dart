import 'dart:math';

enum GeneroMusical { rock, hiphop, funk, trap, eletronica }

void main() {
  final random = Random();
  final numeroAleatorio = random.nextInt(5);

  var generoEscolhido = switch (numeroAleatorio) {
    0 => GeneroMusical.rock.name,
    1 => GeneroMusical.hiphop.name,
    2 => GeneroMusical.funk.name,
    3 => GeneroMusical.trap.name,
    4 => GeneroMusical.eletronica.name,
    _ => "Opcao invalida",
  };

  print(" Meu gênero musical preferido e o $generoEscolhido");
}
