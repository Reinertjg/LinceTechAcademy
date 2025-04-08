
void main() {
  List<int> listaNumero = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  final elemento = 8;

  final listaNova = (removerElemento(listaNumero, elemento));

  for(var elemento in listaNova) {
    print("Elemento: $elemento");
  }
}

List<int> removerElemento(List<int>? listaNumero, int? elemento) {

  listaNumero?.remove(elemento);

  return listaNumero ?? [];
}