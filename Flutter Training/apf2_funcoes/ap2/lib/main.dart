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
              Stack(
                children: [
                  Container(height: 100, width: 100, color: Colors.grey),
                  Positioned(
                    top: 7,
                    left: 7,
                    child: Container(
                        height: 50,
                        width: 50,
                        color: Colors.red),
                  ),
                  Positioned(
                    top: 17,
                    left: 17,
                    child: Container(
                      height: 50,
                      width: 50,
                      color: Colors.green,
                    ),
                  ),
                  Positioned(
                    top: 27,
                    left: 27,
                    child: Container(
                        height: 50,
                        width: 50,
                        color: Colors.blue),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Segundo Stack
              Stack(
                children: [
                  Container(height: 100, width: 100, color: Colors.black),
                  Positioned(
                    top: 7,
                    left: 7,
                    child: Container(
                        height: 50,
                        width: 50,
                        color: Colors.cyan),
                  ),
                  Positioned(
                    top: 17,
                    left: 17,
                    child: Container(
                      height: 50,
                      width: 50,
                      color: Colors.purple,
                    ),
                  ),
                  Positioned(
                    top: 27,
                    left: 27,
                    child: Container(
                        height: 50,
                        width: 50,
                        color: Colors.yellow),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Terceiro Stack
              Stack(
                children: [
                  Container(height: 100, width: 100, color: null),
                  Positioned(
                    top: 7,
                    left: 7,
                    child: Container(
                        height: 50,
                        width: 50,
                        color: Colors.red),
                  ),
                  Positioned(
                    top: 17,
                    left: 17,
                    child: Container(
                      height: 50,
                      width: 50,
                      color: Colors.yellow,
                    ),
                  ),
                  Positioned(
                    top: 27,
                    left: 27,
                    child: Container(
                        height: 50,
                        width: 50,
                        color: Colors.blue),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Quarto Stack
              Stack(
                children: [
                  Container(height: 100, width: 100, color: Colors.white),
                  Positioned(
                    top: 7,
                    left: 7,
                    child: Container(
                        height: 50,
                        width: 50,
                        color: Colors.purple),
                  ),
                  Positioned(
                    top: 17,
                    left: 17,
                    child: Container(
                      height: 50,
                      width: 50,
                      color: Colors.red,
                    ),
                  ),
                  Positioned(
                    top: 27,
                    left: 27,
                    child: Container(
                        height: 50,
                        width: 50,
                        color: Colors.yellow),
                  ),
                  Positioned(
                    top: 37,
                    left: 37,
                    child: Container(
                        height: 50,
                        width: 50,
                        color: Colors.lightGreen),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
