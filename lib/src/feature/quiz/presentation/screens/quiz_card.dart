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
          'Подготовка',
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
          QuizBlocLoadedState() => const Placeholder(),
          QuizBlocLoadingState() => const CircularProgressIndicator(),
          QuizBlocErrorState() => const ErrorScreen(),
          _ => const Placeholder(),
        },
      ),
    );
  }
}
