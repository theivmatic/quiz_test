import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quiz_test/src/feature/domain/databases/training_database.dart';

part 'training_event.dart';
part 'training_state.dart';

class TrainingBloc extends Bloc<TrainingBlocEvent, TrainingBlocState> {
  TrainingBloc() : super(TrainingBlocInitialState()) {
    List trainings = [];
    on<FetchTrainingEvent>((event, emit) async {
      trainings = await TrainingDatabase.instance.readAllJson();
      emit(DisplayTraining(training: trainings));
    });
  }
}
