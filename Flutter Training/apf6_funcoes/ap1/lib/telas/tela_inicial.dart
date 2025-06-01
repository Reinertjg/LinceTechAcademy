import 'package:flutter/material.dart';

class TelaInicial extends StatefulWidget {
  const TelaInicial({super.key});

  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  double opacity = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela Inicial'),
        backgroundColor: Color(0xFF333446),
      ),
      backgroundColor: Color(0xFF222831),
      body: Center(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Bem-vindo!',
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 40),

        blueButton(text: 'Listagem', route: '/listagem'),

        SizedBox(height: 20),

        blueButton(text: 'Formulario', route: '/formulario')

      ],
    ),)
    ,
    );
  }
  }
  
  class blueButton extends StatefulWidget {
    const blueButton({required this.text, required this.route,super.key});
    
    final String text;
    final String route;

  @override
  State<blueButton> createState() => _blueButtonState();
}

class _blueButtonState extends State<blueButton> {
    @override
    Widget build(BuildContext context) {
      return ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, widget.route);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF00ADB5),
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          widget.text,
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      );
    }
}
  