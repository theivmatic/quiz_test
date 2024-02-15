part of 'quiz_bloc.dart';

sealed class QuizzesBlocState {}

final class QuizzesBlocInitialState extends QuizzesBlocState {}

final class QuizzesBlocLoadingState extends QuizzesBlocState {}

final class QuizzesBlocLoadedState extends QuizzesBlocState {
  final QuizzesEntity quizzesLoaded;

  QuizzesBlocLoadedState({required this.quizzesLoaded});
}

final class QuizzesBlocErrorState extends QuizzesBlocState {
  final String errorMessage;

  QuizzesBlocErrorState({required this.errorMessage});
}
