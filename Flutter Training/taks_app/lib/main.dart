import 'package:flutter/material.dart';

import 'difficulty.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var opacity = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(title: Text('Task App')),
        body: AnimatedOpacity(
          opacity: opacity ? 1 : 0,
          duration: Duration(seconds: 2),
          child: ListView(
            children: [
              Task(
                'Flutter',
                'https://cdn.prod.website-files.com/654366841809b5be271c8358/659efd7c0732620f1ac6a1d6_why_flutter_is_the_future_of_app_development%20(1).webp',
                5,
              ),
              Task(
                'Dart',
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQUltGkCPo8TgI8EC7xoTk9OAGK_6DivdquIw&s',
                3,
              ),
              Task(
                'Video games',
                'https://s2-techtudo.glbimg.com/b_unTeZIzl9wmcqoCwScjEepYR0=/0x0:755x426/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_08fbf48bc0524877943fe86e43087e7a/internal_photos/bs/2021/R/a/Xav7B9QaaTHBE5s5KjTw/destaque-premium-beat.jpg',
                1,
              ),
              Task(
                'Academia',
                'https://p2.trrsf.com/image/fget/cf/1200/1200/middle/images.terra.com/2024/07/04/1275438437-academia.jpg',
                3,
              ),
              Task(
                'Bike',
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVWONG3C9pN_HsnxohM6RZCHoILFCJ1Lt3hg&s',
                2,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          setState(() {
            opacity = !opacity;
          });
        },
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        child: Icon(Icons.remove_red_eye_outlined),),
      ),
    );
  }
}

//Trecho de código suprimido

class Task extends StatefulWidget {
  final String title;
  final String imageUrl;
  final int difficulty;

  const Task(this.title, this.imageUrl, this.difficulty, {super.key});

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
          Container(
            height: 140,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Column(
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black45,
                      offset: Offset(0, 2),
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      color: Colors.black26,
                      width: 72,
                      height: 100,
                      child: Image.network(widget.imageUrl, fit: BoxFit.cover),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                        Difficulty(difficultyLevel: widget.difficulty),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            // Implementar ação de completar tarefa
                            setState(() {
                              level++;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: EdgeInsets.all(0),
                          ),
                          child:
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.arrow_drop_up,
                                color: Colors.white,
                                size: 35,
                              ),
                              Text(
                                'UP',
                                style: TextStyle(fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                        value: (widget.difficulty > 0)
                            ? (level / widget.difficulty) / 5
                            : 1,
                        backgroundColor: Colors.white,
                      ),
                    ),
                    Text(
                      'Nivel: $level',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

