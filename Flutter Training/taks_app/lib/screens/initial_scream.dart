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