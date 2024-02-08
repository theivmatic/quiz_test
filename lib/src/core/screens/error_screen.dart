import 'package:flutter/material.dart';
import 'package:quiz_test/src/core/constants/app_theme.dart';
import 'package:quiz_test/src/core/widgets/bottom_button.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: Column(
        children: [
          const SizedBox(height: 200),
          Center(
            child: Image.asset('assets/images/exclamation_point.png'),
          ),
          const SizedBox(height: 40),
          Text(
            'Кажется что-то пошло не так',
            style: TextStyles.appBarText,
          ),
          const SizedBox(height: 20),
          Text(
            'Попробуйте обновить страницу',
            style: TextStyles.errorText,
          ),
          const SizedBox(height: 40),
          BottomButtonWidget(
            buttonText: 'Обновить',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
