import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Jogo());
  }
}

class Jogo extends StatefulWidget {
  const Jogo({super.key});

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  Color corDeFundo = Colors.white;
  int tentativa = 0;
  int botaoCorreto = -1;
  String mensagem = "Escolha um Botão!!";

  @override
  void initState()  {
    super.initState();
    escolherBotao();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: corDeFundo,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              mensagem,
              style: const TextStyle(fontSize: 24, color: Colors.black),
            ),
            ElevatedButton(
              onPressed: () {
                validarTentativa(0);
              },
              child: const Text('Botão A'),
            ),
            const SizedBox(height: 16), // espaço entre os botões
            ElevatedButton(
              onPressed: () {
                validarTentativa(1);
              },
              child: const Text('Botão B'),
            ),
            const SizedBox(height: 16), // espaço entre os botões
            ElevatedButton(
              onPressed: () {
                validarTentativa(2);
              },
              child: const Text('Botão C'),
            ),
          ],
        ),
      ),
    );
  }

  void escolherBotao() {
    var random = Random();
    botaoCorreto = random.nextInt(3);
  }

  void validarTentativa(int botaoEscolhido) {
    setState(() {
      tentativa++;
      if (botaoEscolhido == botaoCorreto) {
        corDeFundo = Colors.green;
        mensagem = 'Você acertou!';
        tentativa = 0;
        escolherBotao();
      } else if (tentativa >= 2) {
        corDeFundo = Colors.red;
        mensagem = 'Você perdeu!';
        tentativa = 0;
        escolherBotao();
      } else {
        corDeFundo = Colors.white;
        mensagem = 'Escolha um botão!!';
      }
    });
  }
}
