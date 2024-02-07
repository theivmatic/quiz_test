import 'package:flutter/material.dart';
import 'package:quiz_test/src/core/constants/app_theme.dart';
import 'package:quiz_test/src/feature/presentation/widgets/bottom_navigation_bar.dart';

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
      body: const Placeholder(),
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
    
  }
}
