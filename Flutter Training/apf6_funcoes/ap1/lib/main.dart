import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ap1/telas/tela_formulario.dart';
import 'package:ap1/telas/tela_inicial.dart';
import 'package:ap1/telas/tela_listagem.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(
  ChangeNotifierProvider(
    create: (_) => EstadoListaDePessoas(),
    child: MyApp()
  )
  );
}

enum TipoSanguineo {
  aPositivo,
  aNegativo,
  bPositivo,
  bNegativo,
  oPositivo,
  oNegativo,
  abPositivo,
  abNegativo,
}

class Pessoa {
  const Pessoa({
    required this.nome,
    required this.email,
    required this.telefone,
    required this.github,
    required this.tipoSanguineo,
  });

  final String nome;
  final String email;
  final String telefone;
  final String github;
  final TipoSanguineo tipoSanguineo;

// todo: implementar equals e hashcode
}

class EstadoListaDePessoas with ChangeNotifier {
  final _listaDePessoas = <Pessoa>[];

  List<Pessoa> get pessoas => List.unmodifiable(_listaDePessoas);

  void incluir(Pessoa pessoa) {
    _listaDePessoas.add(pessoa);
    notifyListeners();
  }

  void excluir(Pessoa pessoa) {
    _listaDePessoas.remove(pessoa);
    notifyListeners();
  }

// todo: implementar métodos restantes
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBlue,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => TelaInicial(),
        '/listagem': (_) => TelaListagem(),
        '/formulario': (_) => TelaFormulario(),
      },
    );
  }
}

