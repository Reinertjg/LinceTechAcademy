
void main() {
  var agora = DateTime.now();

  print('Data atual: ${agora.day}/${agora.month}/${agora.year}');

  print('Data calculada: ${calcular18dias(agora)}');
}

String calcular18dias(var agora) {
  int contador = 0;
  while(contador < 18){
    if(agora.weekday != DateTime.saturday && agora.weekday != DateTime.sunday){
      contador++;
    }
    agora = agora.add(Duration(days: 1));
  }

  return '${agora.day}/${agora.month}/${agora.year}';
}