part of 'quiz_bloc.dart';

sealed class QuizBlocState extends Equatable {
  const QuizBlocState();
  
  @override
  List<Object> get props => [];
}

final class QuizBlocInitialState extends QuizBlocState {}
