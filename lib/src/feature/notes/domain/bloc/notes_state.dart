part of 'notes_bloc.dart';

@immutable
sealed class NotesBlocState extends Equatable {
  const NotesBlocState();
}

final class NotesBlocInitialState extends NotesBlocState {
  @override
  List<Object> get props => [];
}

class DisplayNotes extends NotesBlocState {
  final List<Note> note;

  const DisplayNotes({required this.note});

  @override
  List<Object> get props => [note];
}

class DisplaySpecificNotes extends NotesBlocState {
  final Note note;

  const DisplaySpecificNotes({required this.note});

  @override
  List<Object> get props => [note];
}
