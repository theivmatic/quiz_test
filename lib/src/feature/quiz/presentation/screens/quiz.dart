import 'package:flutter/material.dart';
import 'package:quiz_test/src/core/constants/app_theme.dart';
import 'package:quiz_test/src/feature/quiz/domain/models/quizzes_entity.dart';
import 'package:quiz_test/src/feature/quiz/presentation/screens/quiz_result.dart';
import 'package:quiz_test/src/feature/quiz/presentation/widgets/answer_tile.dart';
import 'package:quiz_test/src/feature/quiz/presentation/widgets/popup.dart';
import 'package:quiz_test/src/feature/quiz/presentation/widgets/question_tile.dart';

class QuizScreen extends StatefulWidget {
  final Quiz? quiz;

  const QuizScreen({
    super.key,
    required this.quiz,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _questionIndex = 0;
  int _totalScore = 0;
  bool answerWasSelected = false;
  bool endOfQuiz = false;
  int? quizLength;
  int quizIndex = 0;

  void _questionAnswered(bool answerScore) {
    setState(() {
      // answer was selected
      answerWasSelected = true;
      // check if answer was correct
      if (answerScore) {
        _totalScore++;
      }
      // when quiz ends
      // if (_questionIndex + 1 == quizLength) {
      //   endOfQuiz = true;
      // }
    });
  }

  Future<void> _nextQuestion() async {
    await Future<void>.delayed(
      const Duration(seconds: 3),
    );
    if (mounted) {
      setState(() {
        if (_questionIndex <
            (widget.quiz?.questions?.length != null
                ? widget.quiz!.questions!.length
                : 0)) {
          _questionIndex++;
        }
        answerWasSelected = false;
      });
    }
    if (_questionIndex + 1 >=
        (widget.quiz?.questions?.length != null
            ? widget.quiz!.questions!.length
            : 0)) {
      endOfQuiz = true;
      // _resetQuiz();
    }
  }

  // void _resetQuiz() {
  //   setState(() {
  //     _questionIndex = 0;
  //     _totalScore = 0;
  //     endOfQuiz = false;
  //   });
  // }

  @override
  void initState() {
    quizLength = widget.quiz?.questions?.length != null
        ? widget.quiz!.questions!.length
        : 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Слово пацана',
          style: TextStyles.appBarText,
        ),
        leading: const PopUpWidget(),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.darkBackground,
      ),
      backgroundColor: AppColors.darkBackground,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Text(
                'Вопрос ${_questionIndex + 1} из $quizLength',
                style: TextStyles.questionCounterText,
              ),
            ),
            QuestionTileWidget(
              questionText: widget.quiz?.questions?[_questionIndex].question,
            ),
            ...(widget.quiz?.questions?[_questionIndex].answers as List<Answer>)
                .map(
              (answer) => AnswerTileWidget(
                answerText: answer.answerText,
                answerColor: answerWasSelected
                    ? answer.isCorrect!
                        ? AppColors.green
                        : AppColors.red
                    : AppColors.answerBackground,
                onTap: () {
                  if (answerWasSelected) {
                    return;
                  }
                  _questionAnswered(answer.isCorrect!);
                  _nextQuestion();
                  if (endOfQuiz == true) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute<dynamic>(
                        builder: (context) => QuizResultScreen(
                          rightAnswers: _totalScore,
                          numberOfQuestions: quizLength ?? 0,
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
