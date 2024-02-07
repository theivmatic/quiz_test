part of 'preparation_bloc.dart';

sealed class PreparationBlocState {}

final class PreparationBlocInitialState extends PreparationBlocState {}

final class PreparationBlocLoadingState extends PreparationBlocState {}

final class PreparationBlocLoadedState extends PreparationBlocState {
  final dynamic preparationLoaded;

  PreparationBlocLoadedState({required this.preparationLoaded});
}

final class PreparationBlocErrorState extends PreparationBlocState {
  final String errorMessage;

  PreparationBlocErrorState({required this.errorMessage});
}
