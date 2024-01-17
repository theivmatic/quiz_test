import 'package:flutter/material.dart';

class QuizThemeScreen extends StatelessWidget {
  const QuizThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Тема квиза',
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w700,
          ),
        ),
        elevation: 0,
        backgroundColor: const Color.fromRGBO(27, 31, 41, 1),
      ),
      backgroundColor: const Color.fromRGBO(27, 31, 41, 1),
    );
  }
}
