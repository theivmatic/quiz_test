import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_test/src/feature/preparation/data/fetch_preparation.dart';
import 'package:quiz_test/src/feature/preparation/domain/models/preparations_entity.dart';

part 'preparation_event.dart';
part 'preparation_state.dart';

class PreparationsBloc extends Bloc<PreparationsBlocEvent, PreparationsBlocState> {
  PreparationsBloc() : super(PreparationsBlocInitialState()) {
    on<FetchPreparationsBlocEvent>(
      (event, emit) async {
        try {
          final preparationsLoaded = await fetchPreparations();
          emit(
            PreparationsBlocLoadedState(preparationsLoaded: preparationsLoaded),
          );
        } on Exception catch (e) {
          emit(
            PreparationsBlocErrorState(
              errorMessage: e.toString(),
            ),
          );
        }
      },
    );
  }
}
