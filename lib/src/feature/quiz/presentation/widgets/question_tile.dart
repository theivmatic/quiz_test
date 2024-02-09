import 'package:flutter/material.dart';
import 'package:quiz_test/src/core/constants/app_theme.dart';

class QuestionTileWidget extends StatelessWidget {
  final String? questionText;

  const QuestionTileWidget({
    super.key,
    required this.questionText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: Container(
            height: 336,
            decoration: BoxDecoration(
              color: AppColors.popupMenuBackground,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  questionText ?? '',
                  style: TextStyles.factNumber,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
