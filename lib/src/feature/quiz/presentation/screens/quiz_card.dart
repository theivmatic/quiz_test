import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_test/src/core/constants/app_theme.dart';
import 'package:quiz_test/src/core/screens/error_screen.dart';
import 'package:quiz_test/src/feature/quiz/domain/bloc/quiz_bloc.dart';
import 'package:quiz_test/src/feature/quiz/presentation/screens/quiz_theme_screen.dart';
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
        leading: const PopUpWidget(),
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
                  'Вопрос ${currentQuestionIndex + 1} из ${state.quizLoaded.questions?.length}', style: TextStyles.questionCounterText,
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
                AnswerTileWidget(
                  answerText:
                      state.quizLoaded.questions?[0].answers?[1].answerText,
                  isCorrect:
                      state.quizLoaded.questions?[0].answers?[1].isCorrect,
                ),
                AnswerTileWidget(
                  answerText:
                      state.quizLoaded.questions?[0].answers?[2].answerText,
                  isCorrect:
                      state.quizLoaded.questions?[0].answers?[2].isCorrect,
                ),
                AnswerTileWidget(
                  answerText:
                      state.quizLoaded.questions?[0].answers?[3].answerText,
                  isCorrect:
                      state.quizLoaded.questions?[0].answers?[3].isCorrect,
                ),
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
