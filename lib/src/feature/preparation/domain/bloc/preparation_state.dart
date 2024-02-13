part of 'preparation_bloc.dart';

sealed class PreparationsBlocState {}

final class PreparationsBlocInitialState extends PreparationsBlocState {}

final class PreparationsBlocLoadingState extends PreparationsBlocState {}

final class PreparationsBlocLoadedState extends PreparationsBlocState {
  final PreparationsEntity preparationsLoaded;

  PreparationsBlocLoadedState({required this.preparationsLoaded});
}

final class PreparationsBlocErrorState extends PreparationsBlocState {
  final String errorMessage;

  PreparationsBlocErrorState({required this.errorMessage});
}
