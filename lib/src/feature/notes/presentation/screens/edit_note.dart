import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_test/src/core/constants/app_theme.dart';
import 'package:quiz_test/src/core/widgets/bottom_button.dart';
import 'package:quiz_test/src/feature/notes/domain/bloc/notes_bloc.dart';
import 'package:quiz_test/src/feature/notes/domain/models/note_model.dart';

class EditNoteScreen extends StatefulWidget {
  const EditNoteScreen({super.key});

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  final TextEditingController _newTitle = TextEditingController();
  final TextEditingController _newDuration = TextEditingController();
  final TextEditingController _newComment = TextEditingController();
  final TextEditingController _newUrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.darkBackground,
        leading: IconButton(
          onPressed: () {
            context.read<NotesBloc>().add(
                  const FetchNotesEvent(),
                );
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: AppColors.iconGrey,
        ),
        title: Text(
          'Редактировать заметку',
          style: TextStyles.appBarText,
        ),
      ),
      backgroundColor: AppColors.darkBackground,
      body: BlocBuilder<NotesBloc, NotesBlocState>(
        builder: (context, state) {
          if (state is DisplaySpecificNotes) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    // initialValue: state.note.movieTitle,
                    controller: _newTitle,
                    style: TextStyles.noteTitleText,
                    decoration: InputDecoration(
                      hintText: 'Название фильма или сериала',
                      hintStyle: TextStyles.hintBigText,
                      disabledBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                    ),
                  ),
                  TextFormField(
                    // initialValue: state.note.dutarion,
                    controller: _newDuration,
                    style: TextStyles.quizResultText,
                    decoration: InputDecoration(
                      hintText: 'Длительность',
                      hintStyle: TextStyles.hintMediumText,
                      disabledBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                    ),
                  ),
                  TextFormField(
                    // initialValue: state.note.comment,
                    controller: _newComment,
                    style: TextStyles.quizResultText,
                    decoration: InputDecoration(
                      hintText: 'Комментарий',
                      hintStyle: TextStyles.hintMediumText,
                      disabledBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                    ),
                  ),
                  TextFormField(
                    // initialValue: state.note.url,
                    controller: _newUrl,
                    style: TextStyles.noteUrlText,
                    decoration: InputDecoration(
                      hintText: 'Ссылка',
                      hintStyle: TextStyles.hintMediumText,
                      disabledBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                    ),
                  ),
                  Center(
                    child: BottomButtonWidget(
                      buttonText: 'Сохранить',
                      onPressed: () {
                        if (_newTitle.text.isNotEmpty &&
                            _newComment.text.isNotEmpty) {
                          context.read<NotesBloc>().add(
                                UpdateNoteEvent(
                                  note: Note(
                                    movieTitle: _newTitle.text,
                                    dutarion: _newDuration.text,
                                    comment: _newComment.text,
                                    url: _newUrl.text,
                                    movieImage: '',
                                  ),
                                ),
                              );
                          Navigator.of(context).pop();
                          context
                              .read<NotesBloc>()
                              .add(const FetchNotesEvent());
                        } else {
                          ScaffoldMessenger.of(context).clearSnackBars();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              duration: const Duration(seconds: 2),
                              content: Text(
                                'Поля название и комментарий должны быть заполнены'
                                    .toUpperCase(),
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
