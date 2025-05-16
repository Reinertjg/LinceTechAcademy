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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quadrados empilhados'),
          backgroundColor: Colors.greenAccent,
        ),
        backgroundColor: Colors.indigo[900],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              // Primeiro Stack
              CriarMonte(
                  Colors.grey,
                  [
                    Colors.red,
                    Colors.green,
                    Colors.blue
                  ]
              ),

              // Segundo Stack
              CriarMonte(
                  Colors.black,
                  [
                    Colors.blue,
                    Colors.purple,
                    Colors.yellow
                  ]
              ),

              // Terceiro Stack
              CriarMonte(
                  null,
                  [
                    Colors.red,
                    Colors.yellow,
                    Colors.blue
                  ]
              ),

              // Quarto Stack
              CriarMonte(
                  Colors.white,
                  [
                    Colors.purple,
                    Colors.red,
                    Colors.yellow,
                    Colors.green
                  ]
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CriarMonte extends StatelessWidget {
  const CriarMonte(
      this.backgroudColor,
      this.listaCores,
      {super.key}
      );

  final Color? backgroudColor;
  final List<Color> listaCores;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      color: backgroudColor,
      width: 100,
      height: 100,
      child: Stack(
        children: [
          for(var i = 0; i < listaCores.length; i++)
            Positioned(
                top: i * 8 + 8,
                left: i * 8 + 8,
                child: Container(
                  width: 50,
                  height: 50,
                  color: listaCores[i],
                ))

        ],
      ),
    );
  }
}