part of 'notes_bloc.dart';

@immutable
sealed class NotesBlocEvent extends Equatable {
  const NotesBlocEvent();
}

class AddNote extends NotesBlocEvent {
  final String movieTitle;
  final String dutarion;
  final String comment;
  final String url;
  final String movieImage;

  const AddNote(
      {required this.movieTitle,
      required this.dutarion,
      required this.comment,
      required this.url,
      required this.movieImage});

  @override
  List<Object?> get props => [movieTitle, dutarion, comment, url, movieImage];
}

class UpdateNote extends NotesBlocEvent {
  final Note note;
  const UpdateNote({required this.note});

  @override
  List<Object?> get props => [];
}

class FetchNotes extends NotesBlocEvent {
  const FetchNotes();

  @override
  List<Object?> get props => [];
}

class FetchSpecificNote extends NotesBlocEvent {
  final int id;
  const FetchSpecificNote({required this.id});

  @override
  List<Object?> get props => [id];
}

class DeleteNote extends NotesBlocEvent {
  final int id;
  const DeleteNote({required this.id});

  @override
  List<Object?> get props => [id];
}