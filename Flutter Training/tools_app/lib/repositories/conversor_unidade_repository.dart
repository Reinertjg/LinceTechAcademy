import 'package:flutter/foundation.dart';

import '../modules/conversor_unidades/models/tipo_conversor.dart';

class ConversorUnidadeRepository extends ChangeNotifier{
  final _listOperations = <ConversorUnidadesModel>[];

  List<ConversorUnidadesModel> get listOperations => _listOperations;

  void addOperation(ConversorUnidadesModel operation) {
    _listOperations.add(operation);
    notifyListeners();
  }

  void removeOperation(ConversorUnidadesModel operation) {
    _listOperations.remove(operation);
    notifyListeners();
  }
}
