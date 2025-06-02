
import 'package:flutter/cupertino.dart';
import 'package:country_flags/country_flags.dart';

class ConversorMoedasController {

  final TextEditingController origemController = TextEditingController();
  final TextEditingController destinoController = TextEditingController();

  String? moedaOrigemSelecionada;

  final opcoesMoedas = [
    'BRL',
    'USD',
  ];
}