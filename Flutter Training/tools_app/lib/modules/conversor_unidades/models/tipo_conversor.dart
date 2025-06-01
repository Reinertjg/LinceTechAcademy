enum CampoEditado { origem, destino }
enum TipoConversor { distancia, peso, temperatura }

String descreverTipo(TipoConversor tipo) {
  return switch (tipo) {
    TipoConversor.distancia => 'Distancia',
    TipoConversor.peso => 'Peso',
    TipoConversor.temperatura => 'Temperatura',
  };
}