import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_test/src/core/constants/app_theme.dart';
import 'package:quiz_test/src/feature/notes/data/databases/notes_database.dart';
import 'package:quiz_test/src/feature/notes/domain/bloc/notes_bloc.dart';
import 'package:quiz_test/src/feature/notes/domain/models/note_model.dart';

class NoteDetailsScreen extends StatefulWidget {
  final Note note;

  const NoteDetailsScreen({
    super.key,
    required this.note,
  });

  @override
  State<NoteDetailsScreen> createState() => _NoteDetailsScreenState();
}

class _NoteDetailsScreenState extends State<NoteDetailsScreen> {
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
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: AppColors.iconGrey,
        ),
        title: Text(
          'Ваша заметка',
          style: TextStyles.appBarText,
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await NotesDatabase.instance.pinNote(note: widget.note);
              if (widget.note.isPinned == false) {
                widget.note.isPinned = true;
              } else {
                widget.note.isPinned = false;
              }
              log(widget.note.isPinned.toString());
              setState(() {});
            },
            icon: Image.asset(
              'assets/icons/pin_icon.png',
              color: widget.note.isPinned
                  ? AppColors.buttonPink
                  : AppColors.iconGrey,
            ),
          ),
          IconButton(
            onPressed: () {
              context.read<NotesBloc>().add(
                    DeleteNoteEvent(
                      id: widget.note.id ?? 0,
                    ),
                  );
              Navigator.of(context).pop();
            },
            icon: Image.asset('assets/icons/delete_icon.png'),
          ),
        ],
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
                    initialValue: state.note.movieTitle,
                    enabled: false,
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
                    initialValue: state.note.dutarion,
                    enabled: false,
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
                    initialValue: state.note.comment,
                    enabled: false,
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
                    initialValue: state.note.url,
                    enabled: false,
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
                  if (state.note.movieImage != '')
                    Image.asset(
                      state.note.movieImage,
                    )
                  else
                    const SizedBox(),
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
