import 'package:flutter/material.dart';
import 'package:quiz_test/src/core/constants/app_theme.dart';

class QuizCardWidget extends StatelessWidget {
  final String? title;
  final int? difficulty;
  final String? imagePath;
  final VoidCallback onCardTap;
  // final int? quizIndex;
  final List<Widget> stars = [];

  QuizCardWidget({
    super.key,
    required this.title,
    required this.difficulty,
    required this.imagePath,
    required this.onCardTap,
    // required this.quizIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: onCardTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Center(
                child: Image.asset(
                  imagePath ?? '',
                  scale: 0.95,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title ?? '',
                      style: TextStyles.quizCardTitleText,
                    ),
                    Row(
                      children: [
                        Text(
                          'Сложность',
                          style: TextStyles.popupTitleText,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
