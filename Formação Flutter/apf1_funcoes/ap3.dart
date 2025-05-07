import 'package:flutter/material.dart';
import 'dart:math';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: Center(child: MyWidget())),
    );
  }
}

class MyWidget extends StatefulWidget {
  @override
  State<MyWidget> createState() => _MyWidgetState();
}

enum EstadoDoJogo { jogando, ganhou, perdeu }

class _MyWidgetState extends State<MyWidget> {
  final random = Random();

  Color corDeFundo = Colors.white;
  String conteudo = 'Esolha 2 Botões';
  EstadoDoJogo estadoAtual = EstadoDoJogo.jogando;

  var botaoCorreto = 0;
  var clicks = 0;

  var vitorias = 0;
  var derrotas = 0;

  // Esse método e chamado somente uma vez, ao iniciar o state
  @override
  void initState() {
    super.initState();
    escolherBotaoCorreto();
  }

  void escolherBotaoCorreto() {
    botaoCorreto = random.nextInt(3); // 0, 1 ou 2
  }

  // Tratar a tentativa do usuário
  void tentativa(int opcao) {
    setState(() {
      if (estadoAtual != EstadoDoJogo.jogando) return;

      if (opcao == botaoCorreto) {
        estadoAtual = EstadoDoJogo.ganhou;
        corDeFundo = Colors.green;
        vitorias++;
      } else {
        clicks++;
        if (clicks >= 2) {
          estadoAtual = EstadoDoJogo.perdeu;
          corDeFundo = Colors.red;
          derrotas++;
        }
      }
    });
  }

  void reiniciarJogo() {
    setState(() {
      clicks = 0;
      corDeFundo = Colors.white;
      estadoAtual = EstadoDoJogo.jogando;
      escolherBotaoCorreto();
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget conteudo;

    switch (estadoAtual) {
      case EstadoDoJogo.jogando:
        conteudo = JogoWidget(
          aoClicarBotao: tentativa,
          vitorias: vitorias,
          derrotas: derrotas,
        );
        break;
      case EstadoDoJogo.ganhou:
        conteudo = VitoriaWidget(aoReiniciar: reiniciarJogo);
        break;
      case EstadoDoJogo.perdeu:
        conteudo = DerrotaWidget(aoReiniciar: reiniciarJogo);
        break;
    }

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: corDeFundo,
        child: conteudo,
      ),
    );
  }
}

class JogoWidget extends StatelessWidget {
  final Function(int) aoClicarBotao;
  final int vitorias;
  final int derrotas;

  const JogoWidget({
    required this.aoClicarBotao,
    required this.vitorias,
    required this.derrotas,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Escolha 2 botões',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () => aoClicarBotao(0),
          child: const Text('Botão A'),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () => aoClicarBotao(1),
          child: const Text('Botão B'),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () => aoClicarBotao(2),
          child: const Text('Botão C'),
        ),
        const SizedBox(height: 64),
        Text(
          'Vitorias: $vitorias',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        Text(
          'Derrotas: $derrotas',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ],
    );
  }
}

class VitoriaWidget extends StatelessWidget {
  final VoidCallback aoReiniciar;

  const VitoriaWidget({required this.aoReiniciar, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Você Ganhou!',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: aoReiniciar,
          child: const Text('Jogar Novamente'),
        ),
      ],
    );
  }
}

class DerrotaWidget extends StatelessWidget {
  final VoidCallback aoReiniciar;

  const DerrotaWidget({required this.aoReiniciar, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Você Perdeu!',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: aoReiniciar,
          child: const Text('Tentar Novamente'),
        ),
      ],
    );
  }
}
