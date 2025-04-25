
void main() {
  final tigre = Tigre();

  tigre.comer();
  tigre.beber();
  tigre.rugir();
}

abstract class Animal {

  void comer() {
    print("O animal esta comendo");
  }

  void beber() {
    print("O animal esta bebendo");
  }
}

class Tigre extends Animal {
  void rugir() {
    print("O Tigre esta rugindo");
  }

}