part of 'quiz_bloc.dart';

sealed class QuizBlocState {}

final class QuizBlocInitialState extends QuizBlocState {}

final class QuizBlocLoadingState extends QuizBlocState {}

final class QuizBlocLoadedState extends QuizBlocState {
  final QuizEntity quizLoaded;

  QuizBlocLoadedState({required this.quizLoaded});
}

final class QuizBlocErrorState extends QuizBlocState {
  final String errorMessage;

  QuizBlocErrorState({required this.errorMessage});
}
