import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: TelaPricipal());
  }
}

class TelaPricipal extends StatefulWidget {
  const TelaPricipal({super.key});

  @override
  State<TelaPricipal> createState() => _TelaPricipalState();
}

class _TelaPricipalState extends State<TelaPricipal> {
  Color corDeFundo = Colors.white;

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
            ElevatedButton(
              onPressed: () {
                setState(() {
                  corDeFundo = gerarCorAleatoria();
                });
              },
              child: const Text('Mudar Cor'),
            ),
            const SizedBox(height: 16), // espaço entre os botões
            ElevatedButton(
              onPressed: () {
                setState(() {
                  corDeFundo = Colors.white;
                });
              },
              child: const Text('Resetar Cor'),
            ),
          ],
        ),
      ),
    );
  }

  Color gerarCorAleatoria() {
    final random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }
}
