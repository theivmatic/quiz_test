part of 'preparation_bloc.dart';

sealed class PreparationBlocState extends Equatable {
  const PreparationBlocState();
  
  @override
  List<Object> get props => [];
}

final class PreparationBlocInitialState extends PreparationBlocState {}
