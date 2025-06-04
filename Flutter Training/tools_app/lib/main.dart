import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tools_app/Telas/tela_calculadora.dart';
import 'package:flutter/material.dart';
import 'package:tools_app/Telas/tela_inicio.dart';
import 'package:tools_app/modules/conversor_moedas/pages/conversor_moeda_page.dart';
import 'modules/conversor_unidades/pages/conversor_unidades_page.dart';

Future<void> main() async {

  // Garante que os bindings do Flutter estejam inicializados
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializa o Hive
  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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