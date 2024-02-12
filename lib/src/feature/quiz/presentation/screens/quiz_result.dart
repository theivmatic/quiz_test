import 'package:flutter/material.dart';
import 'package:quiz_test/src/core/constants/app_theme.dart';
import 'package:quiz_test/src/core/router/navigation_screen.dart';
import 'package:quiz_test/src/core/widgets/bottom_button.dart';

class QuizResultScreen extends StatelessWidget {
  final int numberOfQuestions;
  final int rightAnswers;

  const QuizResultScreen({
    super.key,
    required this.numberOfQuestions,
    required this.rightAnswers,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Слово пацана',
          style: TextStyles.appBarText,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.darkBackground,
      ),
      backgroundColor: AppColors.darkBackground,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Row(),
            const SizedBox(
              height: 15,
            ),
            Text(
              rightAnswers == numberOfQuestions
                  ? 'Вот это да!\nВы лучший из лучших!'
                  : 'Неплохо!\nНо вы можете лучше!',
              style: TextStyles.factNumber,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Вы правильно ответили\nна $rightAnswers вопрос(ов) из $numberOfQuestions',
              style: TextStyles.quizResultText,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 25,
            ),
            BottomButtonWidget(
              buttonText: 'Закончить',
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute<dynamic>(
                    builder: (context) => const NavigationScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
