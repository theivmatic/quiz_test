import 'package:flutter/material.dart';
import 'package:quiz_test/src/feature/presentation/screens/quiz_theme_screen.dart';
import 'package:quiz_test/src/feature/presentation/screens/start_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: QuizThemeScreen(),
    );
  }
}
