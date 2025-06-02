import 'package:flutter/material.dart';
import '../models/tipo_conversor.dart';
import '../services/conversor.dart';
import '../services/conversor_distancia.dart';
import '../services/conversor_temperatura.dart';
import '../services/conversor_peso.dart';

class ConversorUnidadesController {
  // Controladores de texto
  final TextEditingController origemController = TextEditingController();
  final TextEditingController destinoController = TextEditingController();

  // Estado de seleção
  TipoConversor? tipoSelecionado;
  String? unidadeOrigemSelecionada;
  String? unidadeDestinoSelecionada;
  bool textConversor = false;
  double textConversorDouble = 0.0;
  CampoEditadoUnidade? campoEditado;

  // Dados fixos
  final Map<TipoConversor, List<String>> dadosSelecioandos = {
    TipoConversor.distancia: ['Km', 'm', 'cm'],
    TipoConversor.temperatura: ['Celsius', 'Fahrenheit', 'Kelvin'],
    TipoConversor.peso: ['Kg', 'g', 'mg'],
  };

  List<String> opcoesUnidades = [];

  String abreviarTipo(String? tipo) {
    if (tipo == null) return '';
    return switch (tipo) {
      'Celsius' => '°C',
      'Fahrenheit' => '°F',
      'Kelvin' => 'K',
      _ => tipo
    };
  }

  void atualizarUnidade({
    required bool atualizandoOrigem,
    required String novaUnidade,
  }) {
    if (atualizandoOrigem) {
      final temp = unidadeOrigemSelecionada;
      unidadeOrigemSelecionada = novaUnidade;

      if (unidadeOrigemSelecionada == unidadeDestinoSelecionada) {
        unidadeOrigemSelecionada = unidadeDestinoSelecionada;
        unidadeDestinoSelecionada = temp;
      }
    } else {
      final temp = unidadeDestinoSelecionada;
      unidadeDestinoSelecionada = novaUnidade;

      if (unidadeOrigemSelecionada == unidadeDestinoSelecionada) {
        unidadeDestinoSelecionada = unidadeOrigemSelecionada;
        unidadeOrigemSelecionada = temp;
      }
    }
  }

  void trocarUnidades() {
    final temp = unidadeOrigemSelecionada;
    unidadeOrigemSelecionada = unidadeDestinoSelecionada;
    unidadeDestinoSelecionada = temp;

    final tempController = origemController.text;
    origemController.text = destinoController.text;
    destinoController.text = tempController;
  }

  void calcularConversao() {
    final conversor =
        criarConversorCorreto(); // méodo que instancia a classe correta

    if (campoEditado == CampoEditadoUnidade.origem) {
      if (origemController.text.isEmpty) {
        destinoController.text = "";
        return;
      }

      double valor = double.tryParse(origemController.text) ?? 0;
      double resultado = conversor.converter(
        valor,
        unidadeOrigemSelecionada!,
        unidadeDestinoSelecionada!,
      );
      destinoController.text = resultado.toString();
    } else if (campoEditado == CampoEditadoUnidade.destino) {
      if (destinoController.text.isEmpty) {
        origemController.text = "";
        return;
      }

      double valor = double.tryParse(destinoController.text) ?? 0;
      double resultado = conversor.converter(
        valor,
        unidadeDestinoSelecionada!,
        unidadeOrigemSelecionada!,
      );
      origemController.text = resultado.toString();
    }
  }

  String calcularConversaoText() {
    double valor = 1;
    if (tipoSelecionado == null) {
      return '';
    } else if (tipoSelecionado == TipoConversor.temperatura) {
      valor = 0;
    }
    final conversor =
        criarConversorCorreto(); // méodo que instancia a classe correta
    textConversorDouble = conversor.converter(
      valor,
      unidadeOrigemSelecionada!,
      unidadeDestinoSelecionada!,
    );
    return textConversorDouble.toString();
  }

  String obterTextoOrigem() {
    if (tipoSelecionado == TipoConversor.temperatura) {
      return '0';
    } else {
      return "1";
    }
  }

  Conversor criarConversorCorreto() {
    switch (tipoSelecionado) {
      case TipoConversor.distancia:
        return ConversorDistancia();
      case TipoConversor.temperatura:
        return ConversorTemperatura();
      case TipoConversor.peso:
        return ConversorPeso();
      default:
        throw Exception('Conversor não implementado');
    }
  }
}
