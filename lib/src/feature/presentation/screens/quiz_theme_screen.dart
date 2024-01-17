import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_test/src/feature/presentation/widgets/bottom_navigation_bar.dart';

class QuizThemeScreen extends StatelessWidget {
  const QuizThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Тема квиза',
          style: GoogleFonts.robotoFlex(
            textStyle: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color.fromRGBO(27, 31, 41, 1),
      ),
      backgroundColor: const Color.fromRGBO(27, 31, 41, 1),
      body: BottomNavigationBarWidget(),
    );
    
  }
}
