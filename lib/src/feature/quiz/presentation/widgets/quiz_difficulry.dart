import 'package:flutter/material.dart';
import 'package:quiz_test/src/core/constants/app_theme.dart';

class QuizDifficultyWidget extends StatelessWidget {
  const QuizDifficultyWidget({
    super.key,
    required this.difficulty,
  });

  final int? difficulty;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Сложность',
          style: TextStyles.popupTitleText,
        ),
        const Icon(
          Icons.star_border,
          color: AppColors.buttonPink,
        ),
        Icon(
          Icons.star_border,
          color: difficulty! >= 2 ? AppColors.buttonPink : AppColors.iconGrey,
        ),
        Icon(
          Icons.star_border,
          color: difficulty! == 3 ? AppColors.buttonPink : AppColors.iconGrey,
        ),
      ],
    );
  }
}
