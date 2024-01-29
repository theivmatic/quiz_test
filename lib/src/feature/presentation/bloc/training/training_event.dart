part of 'training_bloc.dart';

sealed class TrainingBlocEvent extends Equatable {
  const TrainingBlocEvent();

  @override
  List<Object> get props => [];
}

class FetchTrainingEvent extends TrainingBlocEvent {
  const FetchTrainingEvent();
}
