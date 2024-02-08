import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_test/src/feature/preparation/data/fetch_preparation.dart';
import 'package:quiz_test/src/feature/preparation/domain/models/preparation_entity.dart';

part 'preparation_event.dart';
part 'preparation_state.dart';

class PreparationBloc extends Bloc<PreparationBlocEvent, PreparationBlocState> {
  PreparationBloc() : super(PreparationBlocInitialState()) {
    on<FetchPreparationBlocEvent>(
      (event, emit) async {
        try {
          final preparationLoaded = await fetchPreparation();
          emit(
            PreparationBlocLoadedState(preparationLoaded: preparationLoaded),
          );
        } on Exception catch (e) {
          emit(
            PreparationBlocErrorState(
              errorMessage: e.toString(),
            ),
          );
        }
      },
    );
  }
}
