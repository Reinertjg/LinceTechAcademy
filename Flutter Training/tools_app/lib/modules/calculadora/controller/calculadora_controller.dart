import 'package:flutter/cupertino.dart';

class CalculadoraController {
  double _resultado = 0.0;
  double valorTela = 0.0;
  double calculoSuperior = 0.0;
  String hintText = '0';

  final TextEditingController valorController = TextEditingController();
  final TextEditingController operacaoController = TextEditingController();

  void calcularResultado(String tecla) {
          switch (tecla) {
            case 'AC':
              valorController.text = '';
              operacaoController.text = '';
              _resultado = 0.0;
              hintText = '0';
              break;
            case '+':
              if (valorController.text.isNotEmpty) {
                double valorAtual = double.tryParse(valorController.text) ?? 0.0;
                _resultado += valorAtual;
                operacaoController.text = '${_resultado} + ';
                valorController.text = '';
                hintText = _resultado.toString();
              }
              break;
            case '-':
              if (valorController.text.isNotEmpty) {
                double valorAtual = double.tryParse(valorController.text) ?? 0.0;
                _resultado -= valorAtual;
                operacaoController.text = '${_resultado} - ';
                valorController.text = '';
                hintText = _resultado.toString();
              }
              break;
            case '=':
              if (valorController.text.isNotEmpty) {
                double valorAtual = double.tryParse(valorController.text) ?? 0.0;
                _resultado += valorAtual;
                operacaoController.text += '${valorController.text} = ';
              }
              valorController.text = _resultado.toString();
              _resultado = 0.0;
              break;
            default:
              valorController.text += tecla;
              break;
          }
        }
  }

