
void main() {
  List<double> listaDecimais = [
    3,
    17,
    23,
    49,
    328,
    1358,
    21,
    429,
    12,
    103,
    20021
  ];
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
  String hexa = "";
  const mapaHex = '0123456789ABCDEF';
  int inteiro = valor.toInt();

  while (inteiro >= 1) {
    int resto = (inteiro % 16);
    hexa = mapaHex[resto] + hexa;
    inteiro ~/= 16;
  }
  return hexa;
}

void imprimi(List listaDecimais) {
  listaDecimais.sort();
  for (var numero in listaDecimais) {

    print(
      "decimal: ${numero.toStringAsFixed(0)}, "
      "binário: ${conversaoBinario(numero)}, "
      "octal: ${conversaoOctal(numero)}, "
      "hexadecimal: ${conversaoHexadecimal(numero)}",
    );
  }
}
