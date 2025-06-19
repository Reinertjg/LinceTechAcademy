import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:tools_app/modules/calculadora/pages/calculadora_page.dart';
import 'package:flutter/material.dart';
import 'package:tools_app/home_scream.dart';
import 'package:tools_app/modules/conversor_moedas/pages/conversor_moeda_page.dart';
import 'package:tools_app/repositories/conversor_unidade_repository.dart';
import 'modules/conversor_unidades/pages/conversor_unidades_page.dart';

Future<void> main() async {

  Provider(
    create: (_) => ConversorUnidadeRepository(),
    child: const MyApp(),
  );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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