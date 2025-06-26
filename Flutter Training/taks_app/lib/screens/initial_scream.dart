import 'package:flutter/material.dart';
import 'package:taks_app/components/task.dart';

class InitialScream extends StatefulWidget {
  const InitialScream({super.key});

  @override
  State<InitialScream> createState() => _InitialScreamState();
}

class _InitialScreamState extends State<InitialScream> {
  var opacity = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(title: Text('Task App')),
      body: AnimatedOpacity(
        opacity: opacity ? 1 : 0,
        duration: Duration(seconds: 2),
        child: ListView(
          children: [
            Task('Flutter', 'assets/images/flutter.png', 5),
            Task('Dart', 'assets/images/dart.png', 3),
            Task('Video games', 'assets/images/video_game.jpg', 1),
            Task('Academia', 'assets/images/academia.jpg', 3),
            Task('Bike', 'assets/images/bike.jpg', 2),
            SizedBox(height: 80),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            opacity = !opacity;
          });
        },
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Icon(Icons.remove_red_eye_outlined),
      ),
    );
  }
}
