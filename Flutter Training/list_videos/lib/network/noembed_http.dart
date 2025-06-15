
import 'dart:convert';

import 'package:http/http.dart' as http;

Future<dynamic> conversorData(String urlVideo) async{
  var url =  Uri.parse('https://noembed.com/embed?url=https://www.youtube.com/watch?v=$urlVideo');
  var response = await http.read(url);
  var data = jsonDecode(response);
  return data;
}