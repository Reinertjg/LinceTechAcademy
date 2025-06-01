import 'package:tools_app/Telas/tela_calculadora.dart';
import 'package:flutter/material.dart';
import 'package:tools_app/Telas/tela_inicio.dart';
import 'package:tools_app/Telas/tela_conversor_moeda.dart';
import 'modules/conversor_unidades/pages/conversor_unidades_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ferramentas',
      initialRoute: '/',
      routes: {
        '/': (context) => const Telainicial(),
        '/conversorMoedas': (context) => const ConversorMoeda(),
        '/conversorUnidades': (context) => const ConversorUnidade(),
        '/calculadora': (context) => const Calculadora(),

      },
    );
  }
}