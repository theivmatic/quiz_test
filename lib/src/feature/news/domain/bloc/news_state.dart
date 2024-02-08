part of 'news_bloc.dart';

sealed class NewsBlocState {}

final class NewsBlocInitialState extends NewsBlocState {}

final class NewsBlocLoadingState extends NewsBlocState {}

final class NewsBlocLoadedState extends NewsBlocState {
  final NewsEntity newsLoaded;

  NewsBlocLoadedState({required this.newsLoaded});
}

final class NewsBlocErrorState extends NewsBlocState {
  final String errorMessage;

  NewsBlocErrorState({required this.errorMessage});
}
