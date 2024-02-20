import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_test/src/core/constants/app_theme.dart';
import 'package:quiz_test/src/feature/quiz/presentation/widgets/quiz_difficulry.dart';

class QuizCardWidget extends StatelessWidget {
  final String? title;
  final int? difficulty;
  final String? imagePath;
  final VoidCallback onCardTap;

  const QuizCardWidget({
    super.key,
    required this.title,
    required this.difficulty,
    required this.imagePath,
    required this.onCardTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      child: InkWell(
        onTap: onCardTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Center(
                child: Image.asset(
                  imagePath ?? '',
                  scale: 0.22.w,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      title ?? '',
                      style: TextStyles.quizCardTitleText,
                    ),
                    QuizDifficultyWidget(difficulty: difficulty),
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
