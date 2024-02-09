import 'package:flutter/material.dart';
import 'package:quiz_test/src/core/constants/app_theme.dart';

class AnswerTileWidget extends StatelessWidget {
  final String? answerText;
  final bool? isCorrect;
  final VoidCallback onTap;

  const AnswerTileWidget({
    super.key,
    required this.answerText,
    required this.isCorrect,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 43,
          decoration: BoxDecoration(
            color: AppColors.answerBackground,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              answerText ?? '',
              style: TextStyles.bottomButtonText,
            ),
          ),
        ),
      ),
    );
  }
}
