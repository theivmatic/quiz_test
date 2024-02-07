import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_test/src/feature/data/fetch_preparation.dart';

part 'preparation_event.dart';
part 'preparation_state.dart';

class PreparationBloc extends Bloc<PreparationBlocEvent, PreparationBlocState> {
  PreparationBloc() : super(PreparationBlocInitialState()) {
    on<FetchPreparationBlocEvent>((event, emit) async {
      try {
        final preparationLoaded = await fetchPreparation();
        emit(PreparationBlocLoadedState(preparationLoaded: preparationLoaded));
      } catch (e) {
        emit(PreparationBlocErrorState(errorMessage: e.toString()));
      }
    });
  }
}
