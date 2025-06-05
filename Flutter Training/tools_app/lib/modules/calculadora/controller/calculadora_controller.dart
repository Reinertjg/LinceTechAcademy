

import 'package:flutter/cupertino.dart';

class CalculadoraController {
  double _resultado = 0.0;
  double valor = 0.0;
  String calculo = '';

  final TextEditingController valorController = TextEditingController();
  final TextEditingController operacaoController = TextEditingController();


  void calcularResultado(String tecla) {

    calculo += tecla;
    switch(tecla) {
      case 'AC':
        valorController.clear();
        break;
      case '+':
        valor = double.tryParse(valorController.text) ?? 0.0;
        operacaoController.text += valor.toString() + ' + ';
        _resultado += valor;
        print(valor);
        break;
      case '=':
        // Aqui você pode implementar a lógica para calcular o resultado final
        // Por exemplo, se você estiver acumulando valores, você pode exibir o resultado
        valorController.text = _resultado.toString();
        break;
      default:
        valorController.text += tecla;
        break;
    }
  }
}