import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String> conversor(String moedaOrigem, String moedaDestino, double quantidade) async{
  var url =  Uri.parse('https://api.frankfurter.app/latest?from=${moedaOrigem}&to=${moedaDestino}');
  var response = await http.read(url);
  var data = jsonDecode(response);

  var valor = (quantidade * data["rates"][moedaDestino]).toStringAsFixed(2);
  return valor;
}