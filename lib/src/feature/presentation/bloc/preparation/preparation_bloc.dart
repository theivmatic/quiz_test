import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'preparation_event.dart';
part 'preparation_state.dart';

class PreparationBloc extends Bloc<PreparationBlocEvent, PreparationBlocState> {
  PreparationBloc() : super(PreparationBlocInitialState()) {
    on<PreparationBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
