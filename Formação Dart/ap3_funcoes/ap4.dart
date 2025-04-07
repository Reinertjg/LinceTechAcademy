import 'dart:math';

void main() {
  final random = Random();
  List<double> listaDecimais = List.generate(
    15,
    (_) => (random.nextDouble() * 5000).toInt().toDouble(),
  );
  imprimi(listaDecimais);
}

String conversaoBinario(double valor) {
  String binario = "";

  while (valor >= 1) {
    String resto = (valor % 2).toInt().toString();
    valor = (valor / 2);
    binario = resto + binario;
  }
  return binario;
}

String conversaoOctal(double valor) {
  String octal = "";

  while (valor >= 1) {
    String resto = (valor % 8).toInt().toString();
    valor = (valor / 8);
    octal = resto + octal;
  }
  return octal;
}

String conversaoHexadecimal(double valor) {
  String octal = "";
  const mapaHex = '0123456789ABCDEF';
  int inteiro = valor.toInt();

  while (inteiro >= 1) {
    int resto = (inteiro % 16);
    octal = mapaHex[resto] + octal;
    inteiro ~/= 16;
  }
  return octal;
}

void imprimi(List listaDecimais) {
  listaDecimais.sort();
  for (var numero in listaDecimais) {
    var binario = conversaoBinario(numero);
    var octal = conversaoOctal(numero);
    var hexa = conversaoHexadecimal(numero);

    print(
      "decimal: ${numero.toStringAsFixed(0)}, binário: $binario, octal: $octal, hexadecimal: $hexa",
    );
  }
}
