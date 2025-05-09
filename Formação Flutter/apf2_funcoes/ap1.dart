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
          title: Text('Retangulos Coloridos'),
          backgroundColor: Colors.greenAccent,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(height: 50, width: 50, color: Colors.red),
                const SizedBox(width: 8,),
                Container(height: 50, width: 50, color: Colors.green),
                const SizedBox(width: 8,),
                Container(height: 50, width: 50, color: Colors.blue),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(height: 130, width: 200, color: Colors.yellow),
                    Positioned( 
                      top: 15, left: 10,
                      child: 
                      Container(height: 100, width: 50, color: Colors.purple),
                    ),
                    Positioned( 
                      top: 15, left: 70,
                      child: 
                      Container(height: 100, width: 50, color: Colors.cyan),
                    ),
                    Positioned( 
                      top: 10, left: 135,
                      child: 
                      Container(height: 50, width: 50, color: Colors.purple),
                    ),
                    Positioned( 
                      top: 70, left: 135,
                      child: 
                      Container(height: 50, width: 50, color: Colors.cyan),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Container(height: 70, width: 100, color: Colors.grey),
                    Container(height: 50, width: 50, color: Colors.black),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
