import 'package:flutter/material.dart';
import 'package:quiz_test/src/core/constants/app_theme.dart';

class BottomButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;

  const BottomButtonWidget({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(
          AppColors.buttonPink,
        ),
        fixedSize: MaterialStatePropertyAll(
          Size(343, 43),
        ),
        elevation: MaterialStatePropertyAll(0),
      ),
      child: Text(
        buttonText,
        style: TextStyles.bottomButtonText,
      ),
    );
  }
}
