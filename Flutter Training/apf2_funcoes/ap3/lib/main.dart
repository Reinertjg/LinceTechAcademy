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
    return MaterialApp(home: _tela());
  }
}

class _tela extends StatefulWidget {
  const _tela({super.key});

  @override
  State<_tela> createState() => _telaState();
}

class _telaState extends State<_tela> {
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
              mostrarForma? _Quadrado(cor: corDaForma,):_Circulo(cor: corDaForma,)
            ],
          ),
        ),
      ),
    );
  }
}


class _Quadrado extends StatefulWidget {
  final Color cor;

  const _Quadrado({super.key, required this.cor});

  @override
  State<_Quadrado> createState() => __QuadradoState();
}

class __QuadradoState extends State<_Quadrado> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      width: 75,
      color: widget.cor,
    );
  }
}



class _Circulo extends StatefulWidget {
  final Color cor;


  const _Circulo({super.key, required this.cor});

  @override
  State<_Circulo> createState() => __CirculoState();
}

class __CirculoState extends State<_Circulo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      width: 75,
      decoration: new BoxDecoration(color: widget.cor, shape: BoxShape.circle),
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
