import 'package:flutter/material.dart';
import 'package:quiz_test/src/feature/presentation/widgets/bottom_button.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(27, 31, 41, 1),
      body: Column(
        children: [
          const SizedBox(height: 30),
          Center(
            child: Image.asset(
              'assets/images/start_screen_background_image.png',
            ),
          ),
          const Text(
            'Насколько вы хорошо знаете\n русские сериалы?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w700,
              color: Color.fromRGBO(247, 247, 251, 1),
            ),
          ),
          const SizedBox(height: 30),
          const BottomButtonWidget(
            buttonText: 'Продолжить',
          ),
        ],
      ),
    );
  }
}
