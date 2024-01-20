
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:quiz_test/src/feature/domain/models/note_model.dart';

part 'notes_event.dart';
part 'notes_state.dart';

class NotesBloc extends Bloc<NotesBlocEvent, NotesBlocState> {
  NotesBloc() : super(NotesBlocInitialState()) {
    on<NotesBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
