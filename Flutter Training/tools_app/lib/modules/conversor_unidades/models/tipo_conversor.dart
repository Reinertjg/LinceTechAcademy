class ConversorUnidadesModel {
  final String valorOrigem;
  final String tipoOrigem;
  final String valorDestino;
  final String tipoDestino;

  ConversorUnidadesModel({
    required this.valorOrigem,
    required this.tipoOrigem,
    required this.valorDestino,
    required this.tipoDestino,
  });
}

enum CampoEditadoUnidade { origem, destino }
enum TipoConversor { distancia, peso, temperatura }

String descreverTipo(TipoConversor tipo) {
  return switch (tipo) {
    TipoConversor.distancia => 'Distancia',
    TipoConversor.peso => 'Peso',
    TipoConversor.temperatura => 'Temperatura',
  };
}