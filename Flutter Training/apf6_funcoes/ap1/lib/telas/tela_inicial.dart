import 'package:flutter/material.dart';

class TelaInicial extends StatefulWidget {
  const TelaInicial({super.key});

  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Tela Inicial'),
          backgroundColor: Color(0xFF333446),
        ),
        backgroundColor: Color(0xFF222831),
        body: Column(
          children: [
            ElevatedButton(onPressed: () {
              Navigator.pushNamed(context, '/listagem');
            }, child: Text('Listagem'),
            ),
            ElevatedButton(onPressed: () {
              Navigator.pushNamed(context, '/formulario');
            }, child: Text('Formulário'),
            ),
          ],
        ),
      );
  }
}