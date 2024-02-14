// ignore_for_file: require_trailing_commas

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
            if (rightAnswers == 0)
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.star_border,
                    color: AppColors.iconGrey,
                  ),
                  Icon(
                    Icons.star_border,
                    color: AppColors.iconGrey,
                  ),
                  Icon(
                    Icons.star_border,
                    color: AppColors.iconGrey,
                  ),
                  Icon(
                    Icons.star_border,
                    color: AppColors.iconGrey,
                  ),
                  Icon(
                    Icons.star_border,
                    color: AppColors.iconGrey,
                  ),
                ],
              )
            else if (rightAnswers == numberOfQuestions / 2)
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.star,
                    color: AppColors.buttonPink,
                  ),
                  Icon(
                    Icons.star_border,
                    color: AppColors.iconGrey,
                  ),
                  Icon(
                    Icons.star_border,
                    color: AppColors.iconGrey,
                  ),
                  Icon(
                    Icons.star_border,
                    color: AppColors.iconGrey,
                  ),
                  Icon(
                    Icons.star_border,
                    color: AppColors.iconGrey,
                  ),
                ],
              )
            else if (rightAnswers == numberOfQuestions)
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.star,
                    color: AppColors.buttonPink,
                  ),
                  Icon(
                    Icons.star,
                    color: AppColors.buttonPink,
                  ),
                  Icon(
                    Icons.star,
                    color: AppColors.buttonPink,
                  ),
                  Icon(
                    Icons.star,
                    color: AppColors.buttonPink,
                  ),
                  Icon(
                    Icons.star,
                    color: AppColors.buttonPink,
                  ),
                ],
              ),
            const SizedBox(
              height: 15,
            ),
            if (rightAnswers == 0)
              Text(
                'Не вышло. Возможно стоит пройти подготовку и попробовать снова?',
                style: TextStyles.factNumber,
                textAlign: TextAlign.center,
              )
            else if (rightAnswers == numberOfQuestions / 2)
              Text(
                'Неплохо!\nНо вы можете лучше!',
                style: TextStyles.factNumber,
                textAlign: TextAlign.center,
              )
            else if (rightAnswers == numberOfQuestions)
              Text(
                'Вот это да!\nВы лучший из лучших!',
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
