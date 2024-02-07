const String tableNotes = 'notes';

class NoteFields {
  static final List<String> values = [
    id,
    movieTitle,
    dutarion,
    comment,
    url,
    movieImage,
  ];

  static const String id = '_id';
  static const String movieTitle = 'movieTitle';
  static const String dutarion = 'dutarion';
  static const String comment = 'comment';
  static const String url = 'url';
  static const String movieImage = 'movieImage';
}

class Note {
  final int? id;
  final String movieTitle;
  final String dutarion;
  final String comment;
  final String url;
  final String movieImage;

  Note({
    this.id,
    required this.movieTitle,
    required this.dutarion,
    required this.comment,
    required this.url,
    required this.movieImage,
  });

  Note copy({
    int? id,
    String? movieTitle,
    String? dutarion,
    String? comment,
    String? url,
    String? movieImage,
  }) =>
      Note(
        id: id ?? this.id,
        movieTitle: movieTitle ?? this.movieTitle,
        dutarion: dutarion ?? this.dutarion,
        comment: comment ?? this.comment,
        url: url ?? this.url,
        movieImage: movieImage ?? this.movieImage,
      );

  static Note fromJson(Map<String, Object?> json) => Note(
        id: json[NoteFields.id] as int?,
        movieTitle: json[NoteFields.movieTitle] as String,
        dutarion: json[NoteFields.dutarion] as String,
        comment: json[NoteFields.comment] as String,
        url: json[NoteFields.url] as String,
        movieImage: json[NoteFields.movieImage] as String,
      );

  Map<String, Object?> toJson() => {
        NoteFields.id: id,
        NoteFields.movieTitle: movieTitle,
        NoteFields.dutarion: dutarion,
        NoteFields.comment: comment,
        NoteFields.url: url,
        NoteFields.movieImage: movieImage,
      };
}
