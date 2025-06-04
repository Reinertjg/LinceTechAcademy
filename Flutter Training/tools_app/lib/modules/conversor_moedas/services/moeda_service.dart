import 'package:tools_app/modules/conversor_moedas/services/api_sevice.dart';

import '../models/tipo_conversor.dart';

class MoedaService {


  Future<void> createMapData() async{
    for(var moedaOrigem in taxas.keys) {
      var data = await conversorData(moedaOrigem);
      for(var moedaDestino in taxas[moedaOrigem]!.keys) {
        taxas[moedaOrigem]![moedaDestino] = data['rates'][moedaDestino];
      }
    }
  }

  String converter({
    required String moedaOrigem,
    required String moedaDestino,
    required double valor,
  }) {

    if (taxas[moedaOrigem] == null || taxas[moedaOrigem]![moedaDestino] == null) {
      throw Exception('Taxa de conversão não disponível');
    }
    return (valor * taxas[moedaOrigem]![moedaDestino]!).toStringAsFixed(2);
  }



}



