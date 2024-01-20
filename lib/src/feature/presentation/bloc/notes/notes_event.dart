part of 'notes_bloc.dart';

@immutable
sealed class NotesBlocEvent extends Equatable {
  const NotesBlocEvent();
}

class AddNoteEvent extends NotesBlocEvent {
  final String movieTitle;
  final String dutarion;
  final String comment;
  final String url;
  final String movieImage;

  const AddNoteEvent(
      {required this.movieTitle,
      required this.dutarion,
      required this.comment,
      required this.url,
      required this.movieImage});

  @override
  List<Object?> get props => [movieTitle, dutarion, comment, url, movieImage];
}

class UpdateNoteEvent extends NotesBlocEvent {
  final Note note;
  const UpdateNoteEvent({required this.note});

  @override
  List<Object?> get props => [];
}

class FetchNotesEvent extends NotesBlocEvent {
  const FetchNotesEvent();

  @override
  List<Object?> get props => [];
}

class FetchSpecificNoteEvent extends NotesBlocEvent {
  final int id;
  const FetchSpecificNoteEvent({required this.id});

  @override
  List<Object?> get props => [id];
}

class DeleteNoteEvent extends NotesBlocEvent {
  final int id;
  const DeleteNoteEvent({required this.id});

  @override
  List<Object?> get props => [id];
}