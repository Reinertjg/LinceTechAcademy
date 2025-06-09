import 'package:flutter/cupertino.dart';

class CalculadoraController {
  double primeiroValor = 0.0;
  double segundoValor = 0.0;
  double resultado = 0.0;
  double ultimoValorUsadoNoIgual = 0.0;

  String operador = '';
  bool novoNumero = true;
  bool igualJaPressionado = false;

  String hint = '0';

  final TextEditingController valorController = TextEditingController();
  final TextEditingController operacaoController = TextEditingController();

  /// Função principal que recebe qualquer tecla pressionada
  void calcularResultado(String tecla) {
    print('Tecla pressionada: $tecla');

    switch (tecla) {
      case 'AC':
        limparTudo();
        break;
      case '+':
      case '-':
      case '×':
      case '÷':
        definirOperador(tecla);
        break;
      case '%':
        aplicarPorcentagem();
        break;
      case '=':
        calcularIgual();
        break;
      default:
        adicionarDigito(tecla);
    }
  }

  /// Limpa todo o estado da calculadora
  void limparTudo() {
    primeiroValor = 0.0;
    segundoValor = 0.0;
    resultado = 0.0;
    operador = '';
    novoNumero = true;
    igualJaPressionado = false;
    valorController.text = '';
    operacaoController.text = '';
    hint = '0';
  }

  /// Adiciona dígitos ao campo de texto
  void adicionarDigito(String digito) {
    if (novoNumero) {
      valorController.text = digito;
      novoNumero = false;
    } else {
      valorController.text += digito;
    }
  }

  /// Define a operação matemática (+, -, ×, ÷)
  void definirOperador(String novoOperador) {
      if(valorController.text.isEmpty && operador.isEmpty) {
        operador = '-';
      }
      primeiroValor = double.parse(valorController.text);
      operador = novoOperador;
      resultado = primeiroValor;
      operacaoController.text = '$primeiroValor $operador';
      hint = resultado.toString();

      if(valorController.text.isEmpty) {
        operador = '-';
      }
      valorController.text = '';
      novoNumero = true;
      igualJaPressionado = false;

  }

  /// Calcula o resultado quando pressionado o '='
  void calcularIgual() {
    if (operador.isEmpty) return;



    // Primeira vez que o usuário aperta o =
    if (!igualJaPressionado) {
      if (valorController.text.isEmpty &&
          (operacaoController.text.endsWith('+') ||
              operacaoController.text.endsWith('-') ||
              operacaoController.text.endsWith('×') ||
              operacaoController.text.endsWith('÷'))) {
        segundoValor = primeiroValor;
      } else if (valorController.text.isNotEmpty) {
        segundoValor = double.parse(valorController.text);
        ultimoValorUsadoNoIgual = segundoValor;
      } else {
        segundoValor = ultimoValorUsadoNoIgual;
      }
    }

    if (operacaoController.text.endsWith('=') && !novoNumero) {
      primeiroValorUsadoNoIgual();
      operacaoController.text = '$resultado $operador $segundoValor =';
    }



    switch (operador) {
      case '+':
        resultado += segundoValor;
        operacaoController.text =
            '${resultado - segundoValor} $operador $segundoValor =';
        break;
      case '-':
        resultado -= segundoValor;
        operacaoController.text =
            '${resultado + segundoValor} $operador $segundoValor =';
        break;
      case '×':
        resultado *= segundoValor;
        operacaoController.text =
            '${resultado / segundoValor} $operador $segundoValor =';
        break;
      case '÷':
        if (segundoValor != 0) {
          resultado /= segundoValor;
          operacaoController.text =
              '${resultado * segundoValor} $operador $segundoValor =';
        } else {
          valorController.text = 'Erro';
          operacaoController.text = '';
          return;
        }
        break;
    }

    hint = resultado.toString();
    valorController.text = '';
    novoNumero = true;
    igualJaPressionado = true;
  }

  void primeiroValorUsadoNoIgual() {
    resultado = double.parse(valorController.text);
  }

  void aplicarPorcentagem() {
    if (valorController.text.isEmpty || operador.isEmpty) return;

    double valor = double.tryParse(valorController.text) ?? 0.0;

    // percentual é calculado com base no primeiro valor
    double percentual = primeiroValor * (valor / 100);

    valorController.text = percentual.toString();
  }
}



