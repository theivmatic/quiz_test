import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_test/src/feature/quiz/data/fetch_quiz.dart';
import 'package:quiz_test/src/feature/quiz/domain/models/quiz_entity.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizBlocEvent, QuizBlocState> {
  QuizBloc() : super(QuizBlocInitialState()) {
    on<FetchQuizBlocEvent>((event, emit) async {
      try {
        final quizLoaded = await fetchQuiz();
        emit(
          QuizBlocLoadedState(quizLoaded: quizLoaded),
        );
      } on Exception catch (e) {
        emit(
          QuizBlocErrorState(
            errorMessage: e.toString(),
          ),
        );
      }
    });
  }
}
