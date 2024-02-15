import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_test/src/feature/quiz/data/fetch_quizzes.dart';
import 'package:quiz_test/src/feature/quiz/domain/models/quizzes_entity.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizzesBloc extends Bloc<QuizzesBlocEvent, QuizzesBlocState> {
  QuizzesBloc() : super(QuizzesBlocInitialState()) {
    on<FetchQuizzesBlocEvent>(
      (event, emit) async {
        try {
          final quizzesLoaded = await fetchQuizzes();
          emit(
            QuizzesBlocLoadedState(quizzesLoaded: quizzesLoaded),
          );
        } on Exception catch (e) {
          emit(
            QuizzesBlocErrorState(
              errorMessage: e.toString(),
            ),
          );
        }
      },
    );
  }
}
