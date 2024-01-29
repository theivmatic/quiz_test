part of 'training_bloc.dart';

sealed class TrainingBlocState extends Equatable {
  const TrainingBlocState();
}

final class TrainingBlocInitialState extends TrainingBlocState {
  @override
  List<Object> get props => [];
}

class DisplayTraining extends TrainingBlocState {
  final List training;

  const DisplayTraining({required this.training});

  @override
  List<Object> get props => [training];
}
