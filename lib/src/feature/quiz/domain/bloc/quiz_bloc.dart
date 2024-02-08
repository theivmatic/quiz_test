import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizBlocEvent, QuizBlocState> {
  QuizBloc() : super(QuizBlocInitialState()) {
    on<QuizBlocEvent>((event, emit) {});
  }
}
