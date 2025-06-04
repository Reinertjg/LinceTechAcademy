import 'package:http/http.dart' as http;
import 'dart:convert';

Future<dynamic> conversorData(String moedaOrigem) async{
  var url =  Uri.parse('https://api.frankfurter.dev/v1/latest?base=$moedaOrigem');
  var response = await http.read(url);
  var data = jsonDecode(response);
  return data;
}
