import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: _Tela());
  }
}

class _Tela extends StatefulWidget {
  const _Tela();

  @override
  State<_Tela> createState() => _TelaState();
}

class _TelaState extends State<_Tela> {
  Container forma = Container();
  Color corDaForma = Colors.red;
  String messageButton = 'Alterar para quadrado';
  bool mostrarForma = true;

  void mudarForma() {
    mostrarForma = !mostrarForma;
    if(mostrarForma) {
      messageButton = 'Alterar para circulo';
    } else {
      messageButton = 'Alterar para quadrado';
    }
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        mudarForma();
                      });
                    },
                    child: Text(messageButton),
                  ),
                  SizedBox(width: 15),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        corDaForma = gerarCorAleatoria();
                      });
                    },
                    child: Text('Cor aleatória'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              mostrarForma? _Formas(corDaForma, BoxShape.rectangle):_Formas( corDaForma, BoxShape.circle)
            ],
          ),
        ),
      ),
    );
  }
}

class _Formas extends StatefulWidget {
  const _Formas(this.cor, this.forma);

  final Color cor;
  final BoxShape forma;

  @override
  State<_Formas> createState() => __FormasState();
}

class __FormasState extends State<_Formas> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      width: 75,
      decoration: BoxDecoration(color: widget.cor, shape: widget.forma),
    );
  }
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
