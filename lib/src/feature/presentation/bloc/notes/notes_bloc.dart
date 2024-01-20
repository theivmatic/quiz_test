import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:quiz_test/src/feature/domain/databases/notes_database.dart';
import 'package:quiz_test/src/feature/domain/models/note_model.dart';

part 'notes_event.dart';
part 'notes_state.dart';

class NotesBloc extends Bloc<NotesBlocEvent, NotesBlocState> {
  NotesBloc() : super(NotesBlocInitialState()) {
    List<Note> notes = [];
    on<AddNoteEvent>((event, emit) async {
      await NotesDatabase.instance.create(
        Note(
            movieTitle: event.movieTitle,
            dutarion: event.dutarion,
            comment: event.comment,
            url: event.url,
            movieImage: event.movieImage),
      );
    });

    on<UpdateNoteEvent>((event, emit) async {
      await NotesDatabase.instance.update(
        note: event.note,
      );
    });

    on<FetchNotesEvent>((event, emit) async {
      notes = await NotesDatabase.instance.readAllNotes();
      emit(DisplayNotes(note: notes));
    });

    on<FetchSpecificNoteEvent>((event, emit) async {
      Note note = await NotesDatabase.instance.readNote(id: event.id);
      emit(DisplaySpecificNotes(note: note));
    });

    on<DeleteNoteEvent>((event, emit) async {
      await NotesDatabase.instance.delete(id: event.id);
      add(const FetchNotesEvent());
    });
  }
}
