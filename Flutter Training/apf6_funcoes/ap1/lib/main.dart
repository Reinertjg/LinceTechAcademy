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

  void atualizar(Pessoa pessoaAntiga, Pessoa pessoaAtualizada) {
    _listaDePessoas.remove(pessoaAntiga);
    _listaDePessoas.add(pessoaAtualizada);
    notifyListeners();
  }

  EstadoListaDePessoas() {
    _carregarDadosIniciais();
  }

  void _carregarDadosIniciais() {
    _listaDePessoas.addAll([
      Pessoa(
        nome: 'João Silva',
        email: 'joao@email.com',
        telefone: '11999999999',
        github: 'github.com/joao',
        tipoSanguineo: TipoSanguineo.aPositivo,
      ),
      Pessoa(
        nome: 'Maria Souza',
        email: 'maria@email.com',
        telefone: '11988888888',
        github: 'github.com/maria',
        tipoSanguineo: TipoSanguineo.oNegativo,
      ),
      Pessoa(
        nome: 'Lucas Pereira',
        email: 'lucas@email.com',
        telefone: '21999998888',
        github: 'github.com/lucasp',
        tipoSanguineo: TipoSanguineo.bPositivo,
      ),
      Pessoa(
        nome: 'Ana Oliveira',
        email: 'ana@email.com',
        telefone: '31988887777',
        github: 'github.com/anaoliveira',
        tipoSanguineo: TipoSanguineo.bNegativo,
      ),
      Pessoa(
        nome: 'Pedro Santos',
        email: 'pedro@email.com',
        telefone: '41977776666',
        github: 'github.com/pedrosantos',
        tipoSanguineo: TipoSanguineo.abPositivo,
      ),
      Pessoa(
        nome: 'Carla Almeida',
        email: 'carla@email.com',
        telefone: '51966665555',
        github: 'github.com/carlaa',
        tipoSanguineo: TipoSanguineo.abNegativo,
      ),
      Pessoa(
        nome: 'Rafael Lima',
        email: 'rafael@email.com',
        telefone: '61955554444',
        github: 'github.com/rafaellima',
        tipoSanguineo: TipoSanguineo.oPositivo,
      ),
      Pessoa(
        nome: 'Fernanda Costa',
        email: 'fernanda@email.com',
        telefone: '71944443333',
        github: 'github.com/fernandacosta',
        tipoSanguineo: TipoSanguineo.aNegativo,
      ),
      Pessoa(
        nome: 'Bruno Martins',
        email: 'bruno@email.com',
        telefone: '81933332222',
        github: 'github.com/brunomartins',
        tipoSanguineo: TipoSanguineo.bPositivo,
      ),
      Pessoa(
        nome: 'Juliana Rocha',
        email: 'juliana@email.com',
        telefone: '91922221111',
        github: 'github.com/julianarocha',
        tipoSanguineo: TipoSanguineo.abPositivo,
      ),
    ]);

    notifyListeners();
  }


// todo: implementar métodos restantes
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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

