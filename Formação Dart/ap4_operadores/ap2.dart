import 'dart:math';

void main() {
  List<String> listaString = [
    '10',
    '2XXL7',
    'JOJ0',
    '99',
    '381',
    'AD44',
    '47',
    '2B',
    '123',
    '78'
  ];

  print(converte(listaString));
}

List converte(List listaString) => listaString.map((elemento) => int.tryParse(elemento) ?? 0).toList();