// NAO PODE SER MODIFICADO
// -------------------------------------------------------------
import 'dart:math' as math;

void main() {
  final meioDeComunicacao = aleatorio();
  meioDeComunicacao.fazerLigacao('(47) 99876-5432');
}

MeioDeComunicacao aleatorio() {
  final meiosDeComunicacao = <MeioDeComunicacao>[
    Telefone(),
    Celular(),
    Orelhao(),
  ];

  final random = math.Random();

  return meiosDeComunicacao[random.nextInt(
    meiosDeComunicacao.length,
  )];
}

// Classe Abstrata
abstract class MeioDeComunicacao {
  void fazerLigacao(String s) {

  }
}

// Subclasses (TELEFONE, CELULAR e ORELHAO)
class Telefone extends MeioDeComunicacao {
  @override
  void fazerLigacao(String numero) {
    print("[TELEFONE] Ligando para $numero");
  }
}

class Celular extends MeioDeComunicacao {
  @override
  void fazerLigacao(String numero) {
    print("[CELULAR] Ligando para $numero");
  }
}

class Orelhao extends MeioDeComunicacao {
  @override
  void fazerLigacao(String numero) {
    print("[ORELÃO] Ligando para $numero");
  }
}
