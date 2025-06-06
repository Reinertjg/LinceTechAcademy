

import 'package:flutter/cupertino.dart';

class CalculadoraController {
  double primeiroValor = 0.0;
  double segundoValor = 0.0;
  double resultado = 0.0;
  String operador = '';
  bool novoNumero = true;
  String hint = '0';

  final TextEditingController valorController = TextEditingController();
  final TextEditingController operacaoController = TextEditingController();


  void calcularResultado(String tecla) {


    switch(tecla) {
      case 'AC':
        primeiroValor = 0.0;
        segundoValor = 0.0;
        operador = '';
        novoNumero = true;
        valorController.text = '';
        operacaoController.text = '';
        hint = '0';
        resultado = 0.0;
        break;
      case '+':
      case '-':
      case '×':
      case '÷':
        if (valorController.text.isNotEmpty) {
          primeiroValor = double.parse(valorController.text);
          operador = tecla;
          operacaoController.text += '$primeiroValor $operador';
          resultado += primeiroValor;
          hint = resultado.toString();
          valorController.text = '';
          novoNumero = true;
        }
        break;

      case '=':
        if(operacaoController.text.endsWith('+')) {
          operacaoController.text = '${operacaoController.text}$hint=';
          resultado += hint.isNotEmpty ? double.parse(hint) : 0.0;
        }
        if(operacaoController.text.endsWith('=')) {
          operacaoController.text = '${resultado}$hint=';
          resultado += hint.isNotEmpty ? double.parse(hint) : 0.0;
          hint = resultado.toString();
        }
        if (valorController.text.isNotEmpty && operador.isNotEmpty) {
          segundoValor = double.parse(valorController.text);
          print(operacaoController.text);


          switch (operador) {
            case '+':
              resultado = primeiroValor + segundoValor;
              break;
            case '-':
              resultado = primeiroValor - segundoValor;
              break;
            case '×':
              resultado = primeiroValor * segundoValor;
              break;
            case '÷':
              if (segundoValor != 0) {
                resultado = primeiroValor / segundoValor;
              } else {
                // evitar divisão por zero
                valorController.text = 'Erro';
                operacaoController.text = '';
                return;
              }
              break;
          }

          valorController.text = resultado.toString();
          operacaoController.text = '$primeiroValor $operador $segundoValor =';
          novoNumero = true;
        }
        break;


      default:
        if (novoNumero) {
          valorController.text = tecla;
          novoNumero = false;
        } else {
          valorController.text += tecla;
        }
        break;
    }
  }
}