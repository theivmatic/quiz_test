import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_test/src/core/constants/app_theme.dart';
import 'package:quiz_test/src/core/screens/error_screen.dart';
import 'package:quiz_test/src/feature/quiz/domain/bloc/quiz_bloc.dart';
import 'package:quiz_test/src/feature/quiz/domain/models/quiz_entity.dart';
import 'package:quiz_test/src/feature/quiz/presentation/screens/quiz_result.dart';
import 'package:quiz_test/src/feature/quiz/presentation/widgets/answer_tile.dart';
import 'package:quiz_test/src/feature/quiz/presentation/widgets/popup.dart';
import 'package:quiz_test/src/feature/quiz/presentation/widgets/question_tile.dart';

class QuizCardScreen extends StatefulWidget {
  const QuizCardScreen({super.key});

  @override
  State<QuizCardScreen> createState() => _QuizCardScreenState();
}

class _QuizCardScreenState extends State<QuizCardScreen> {
  late QuizBloc? quizBloc;
  int _questionIndex = 0;
  int _totalScore = 0;
  bool answerWasSelected = false;
  bool endOfQuiz = false;
  int quizLength = 0;

  void _questionAnswered(bool answerScore) {
    setState(() {
      // answer was selected
      answerWasSelected = true;
      // check if answer was correct
      if (answerScore) {
        _totalScore++;
      }
      // when quiz ends
      if (_questionIndex + 1 == quizLength) {
        endOfQuiz = true;
      }
    });
  }

  Future<void> _nextQuestion() async {
    await Future<void>.delayed(
      const Duration(seconds: 3),
    );
    if (mounted) {
      setState(() {
        if (_questionIndex < 2) {
          _questionIndex++;
        }
        answerWasSelected = false;
      });
    }
    if (_questionIndex >= quizLength) {
      endOfQuiz = true;
      // _resetQuiz();
    }
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
      endOfQuiz = false;
    });
  }

  @override
  void initState() {
    quizBloc = context.read<QuizBloc>()..add(FetchQuizBlocEvent());
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
      body: BlocConsumer<QuizBloc, QuizBlocState>(
        bloc: quizBloc,
        listener: (context, state) => switch (state) {
          QuizBlocLoadedState() => quizLength =
              state.quizLoaded.questions?.length ?? 0,
          _ => null,
        },
        builder: (context, state) => switch (state) {
          QuizBlocLoadedState() => Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Вопрос ${_questionIndex + 1} из ${state.quizLoaded.questions?.length}',
                    style: TextStyles.questionCounterText,
                  ),
                  QuestionTileWidget(
                    questionText:
                        state.quizLoaded.questions?[_questionIndex].question,
                  ),
                  ...(state.quizLoaded.questions?[_questionIndex].answers
                          as List<Answer>)
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
                              builder: (context) => const QuizResultScreen(),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          QuizBlocLoadingState() => const CircularProgressIndicator(),
          QuizBlocErrorState() => const ErrorScreen(),
          _ => const Placeholder(),
        },
      ),
    );
  }
}
