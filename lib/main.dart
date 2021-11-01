import 'package:flutter/material.dart';

import 'question_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuestionScreen(),
      theme: ThemeData(
          textTheme: const TextTheme(
              headline2: TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ))),
    );
  }
}
