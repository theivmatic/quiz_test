import 'package:flutter/material.dart';
import 'package:quiz_test/src/core/constants/app_theme.dart';
import 'package:quiz_test/src/core/widgets/bottom_navigation_bar.dart';
import 'package:quiz_test/src/feature/quiz/presentation/screens/quiz_card.dart';

class QuizThemeScreen extends StatelessWidget {
  const QuizThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Тема квиза',
          style: TextStyles.appBarText,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.darkBackground,
      ),
      backgroundColor: AppColors.darkBackground,
      body: Column(
        children: [
          Center(
            child: GestureDetector(
              child: Image.asset(
                'assets/images/quiz_topc.png',
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute<dynamic>(
                    builder: (context) => const QuizCardScreen(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }
}
