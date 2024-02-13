import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_test/src/core/constants/app_theme.dart';
import 'package:quiz_test/src/core/screens/error_screen.dart';
import 'package:quiz_test/src/feature/quiz/domain/bloc/quiz_bloc.dart';
import 'package:quiz_test/src/feature/quiz/presentation/screens/quiz.dart';
import 'package:quiz_test/src/feature/quiz/presentation/widgets/quiz_card.dart';

class QuizThemeScreen extends StatefulWidget {
  const QuizThemeScreen({super.key});

  @override
  State<QuizThemeScreen> createState() => _QuizThemeScreenState();
}

class _QuizThemeScreenState extends State<QuizThemeScreen> {
  late QuizzesBloc? quizzesBloc;

  @override
  void initState() {
    quizzesBloc = context.read<QuizzesBloc>()..add(FetchQuizzesBlocEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Тема квиза',
          style: TextStyles.appBarText,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.darkBackground,
      ),
      backgroundColor: AppColors.darkBackground,
      body: BlocBuilder<QuizzesBloc, QuizzesBlocState>(
        bloc: quizzesBloc,
        builder: (context, state) => switch (state) {
          QuizzesBlocLoadedState() => ListView.builder(
              itemCount: state.quizzesLoaded.quizzes?.length,
              itemBuilder: (context, index) {
                return QuizCardWidget(
                  title: state.quizzesLoaded.quizzes?[index].quizName,
                  difficulty: state.quizzesLoaded.quizzes?[index].difficulty,
                  imagePath: state.quizzesLoaded.quizzes?[index].imagePath,
                );
              },
            ),
          QuizzesBlocLoadingState() => const CircularProgressIndicator(),
          QuizzesBlocErrorState() => const ErrorScreen(),
          _ => const Placeholder(),
        },
      ),

      // Column(
      //   children: [
      //     Center(
      //       child: GestureDetector(
      //         child: Image.asset(
      //           'assets/images/quiz_topc.png',
      //         ),
      //         onTap: () {
      //           Navigator.of(context).pushReplacement(
      //             MaterialPageRoute<dynamic>(
      //               builder: (context) => const QuizCardScreen(),
      //             ),
      //           );
      //         },
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
