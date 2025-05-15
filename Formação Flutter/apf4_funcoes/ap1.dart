import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const Tela1(),
        '/TelaCor': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as Map;
          final String nome = args['nome'];
          final Color cor = args['cor'];

          return TelaCor(nome, cor);
        },
      },
    );
  }
}


final List<Map<String, dynamic>> listaDeCores = [
  {'nome': 'Crimson', 'cor': Color(0xFFDC143C)},
  {'nome': 'Slate Blue', 'cor': Color(0xFF6A5ACD)},
  {'nome': 'Deep Sky Blue', 'cor': Color(0xFF00BFFF)},
  {'nome': 'Dark Orange', 'cor': Color(0xFFFF8C00)},
  {'nome': 'Forest Green', 'cor': Color(0xFF228B22)},
  {'nome': 'Medium Orchid', 'cor': Color(0xFFBA55D3)},
  {'nome': 'Tomato', 'cor': Color(0xFFFF6347)},
  {'nome': 'Turquoise', 'cor': Color(0xFF40E0D0)},
  {'nome': 'Indian Red', 'cor': Color(0xFFCD5C5C)},
];

class Tela1 extends StatelessWidget {

  const Tela1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Arcoiris'),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView(
        children: listaDeCores.map((corMap) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                '/TelaCor',
                arguments: {
                  'nome': corMap['nome'],
                  'cor': corMap['cor'],
                },
              );
            },
            child: Container(
              color: corMap['cor'],
              width: double.infinity,
              alignment: Alignment.center,
              padding: EdgeInsets.all(16),
              child: Text(
                corMap['nome'],
                style: const TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class TelaCor extends StatelessWidget {
  final Color corDeFundo;
  final String nomeCor;

  const TelaCor(this.nomeCor, this.corDeFundo, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: corDeFundo,
      appBar: AppBar(title: Text(nomeCor), backgroundColor: corDeFundo),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Retornar'),
        ),
      ),
    );
  }
}
