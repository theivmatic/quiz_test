import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_test/src/core/constants/app_theme.dart';
import 'package:quiz_test/src/core/screens/error_screen.dart';
import 'package:quiz_test/src/feature/quiz/domain/bloc/quiz_bloc.dart';
import 'package:quiz_test/src/feature/quiz/presentation/screens/quiz_theme_screen.dart';

class QuizCardScreen extends StatefulWidget {
  const QuizCardScreen({super.key});

  @override
  State<QuizCardScreen> createState() => _QuizCardScreenState();
}

class _QuizCardScreenState extends State<QuizCardScreen> {
  late QuizBloc? quizBloc;
  final currentQuestionIndex = 0;

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
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute<dynamic>(
                builder: (context) => const QuizThemeScreen(),
              ),
            );
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.darkBackground,
      ),
      backgroundColor: AppColors.darkBackground,
      body: BlocBuilder<QuizBloc, QuizBlocState>(
        bloc: quizBloc,
        builder: (context, state) => switch (state) {
          QuizBlocLoadedState() => Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Вопрос ${currentQuestionIndex + 1} из ${state.quizLoaded.questions?.length}',
                ),
                QuestionTileWidget(
                  questionText: state.quizLoaded.questions?[0].question,
                ),
                AnswerTileWidget(
                  answerText:
                      state.quizLoaded.questions?[0].answers?[0].answerText,
                  isCorrect:
                      state.quizLoaded.questions?[0].answers?[0].isCorrect,
                ),
                // AnswerTileWidget(
                //   answerText:
                //       state.quizLoaded.questions?[0].answers?[0].answerText,
                //   isCorrect:
                //       state.quizLoaded.questions?[0].answers?[0].isCorrect,
                // ),
                // AnswerTileWidget(
                //   answerText:
                //       state.quizLoaded.questions?[0].answers?[0].answerText,
                //   isCorrect:
                //       state.quizLoaded.questions?[0].answers?[0].isCorrect,
                // ),
                // AnswerTileWidget(
                //   answerText:
                //       state.quizLoaded.questions?[0].answers?[0].answerText,
                //   isCorrect:
                //       state.quizLoaded.questions?[0].answers?[0].isCorrect,
                // ),
              ],
            ),
          QuizBlocLoadingState() => const CircularProgressIndicator(),
          QuizBlocErrorState() => const ErrorScreen(),
          _ => const Placeholder(),
        },
      ),
    );
  }
}

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

class AnswerTileWidget extends StatelessWidget {
  final String? answerText;
  final bool? isCorrect;

  const AnswerTileWidget({
    super.key,
    required this.answerText,
    required this.isCorrect,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
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
    );
  }
}
