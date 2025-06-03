
import 'package:flutter/cupertino.dart';
import 'package:tools_app/modules/conversor_moedas/models/tipo_conversor.dart';
import '../services/moeda_service.dart';

class ConversorMoedasController {

  final TextEditingController origemController = TextEditingController();
  final TextEditingController destinoController = TextEditingController();

  String? moedaOrigemSelecionada = 'BRL';
  String? moedaDestinoSelecionada = 'USD';
  CampoEditadoMoeda? campoEditado;

  final opcoesMoedas = [
    'BRL',
    'USD',
    'EUR',
    'JPY',
    'GBP',
  ];

  String formatarLabelMoeda(String tipo) {
    String label;
    switch (tipo) {
      case 'BRL':
        label = 'BRL';
        break;
      case 'USD':
        label = 'USD';
        break;
      case 'EUR':
        label = 'EUR';
        break;
        case 'JPY':
        label = 'JPY';
        break;
        case 'GBP':
        label = 'GBP';
        break;
      default:
        label = tipo;
    }
    return label;
  }


  void atualizarUnidade({
    required bool atualizandoOrigem,
    required String novaUnidade,
  }) {
    if (atualizandoOrigem) {
      final temp = moedaOrigemSelecionada;
      moedaOrigemSelecionada = novaUnidade;

      if (moedaOrigemSelecionada == moedaDestinoSelecionada) {
        moedaOrigemSelecionada = moedaDestinoSelecionada;
        moedaDestinoSelecionada = temp;
      }
    } else {
      final temp = moedaDestinoSelecionada;
      moedaDestinoSelecionada = novaUnidade;

      if (moedaOrigemSelecionada == moedaDestinoSelecionada) {
        moedaDestinoSelecionada = moedaOrigemSelecionada;
        moedaOrigemSelecionada = temp;
      }
    }
  }

  void trocarMoedas() {
    final temp = moedaOrigemSelecionada;
    moedaOrigemSelecionada = moedaDestinoSelecionada;
    moedaDestinoSelecionada = temp;

    final tempController = origemController.text;
    origemController.text = destinoController.text;
    destinoController.text = tempController;
  }

  void calcularConversao() async{

    if (campoEditado == CampoEditadoMoeda.origem) {
      if (origemController.text.isEmpty) {
        destinoController.text = "";
        return;
      }
      destinoController.text = await conversor(moedaOrigemSelecionada!, moedaDestinoSelecionada!, double.tryParse(origemController.text) ?? 0.0);

    } else if (campoEditado == CampoEditadoMoeda.destino) {
      if (destinoController.text.isEmpty) {
        origemController.text = "";
        return;
      }
      origemController.text = await conversor(moedaDestinoSelecionada!, moedaOrigemSelecionada!, double.tryParse(destinoController.text) ?? 0.0);
    }
  }


}