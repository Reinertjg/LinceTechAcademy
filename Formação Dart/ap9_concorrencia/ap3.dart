
Future<void> main() async {
  print('Iniciando lançamento');

  await contagemLancamento();

  print('Foguete lançado!');
}

Future<void> contagemLancamento() async{

  for(int i = 10; i >= 0; i--){
    await Future.delayed(Duration(seconds: 1));
    print("Contagem: $i");
  }
}