import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Task App')),
        body: ListView(
          children: [
            Task(
              'Aprender Flutter, dart, bloc, provider, clean architecture, testes, etc',
            ),
            Task('Aprender Flutter'),
            Task('Aprender Flutter'),
            Task('Aprender Flutter'),
            Task('Aprender Flutter'),
            Task('Aprender Flutter'),
          ],
        ),
      ),
    );
  }
}

//Trecho de código suprimido

class Task extends StatefulWidget {
    final String title;

    const Task(this.title, {super.key});

    @override
    State<Task> createState() => _TaskState();
  }

  class _TaskState extends State<Task> {
    int level = 0;
    @override
    Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(color: Colors.blue, height: 140),
          Column(
            children: [
              Container(
                color: Colors.white,
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(color: Colors.black26, width: 72, height: 100),
                    SizedBox(
                      width: 200,
                      child: Text(
                        widget.title,
                        style: TextStyle(
                          fontSize: 24,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Implementar ação de completar tarefa
                        setState(() {
                          level++;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        foregroundColor: Colors.white,
                        shape: CircleBorder(),
                      ),
                      child: Icon(Icons.arrow_drop_up, color: Colors.white),
                    ),
                  ],
                ),
              ),
              Text('Nivel: $level', style: TextStyle(color: Colors.white)),
            ],
          ),
        ],
      ),
    );
  }
}
