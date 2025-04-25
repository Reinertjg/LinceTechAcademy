void main() {
  final dino = Dinosauro();

  dino.barulho();
  dino.corre();
}

abstract class Animal {
  void corre() {}
}

abstract class Barulhento {
  void barulho() {}
}

class Dinosauro implements Animal, Barulhento {
  @override
  void barulho() {
    print("O Dinossouro esta fazendo barulho.");
  }

  @override
  void corre() {
    print("O Dinossouro esta correndo.");
  }
}
