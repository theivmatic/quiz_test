import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_test/src/core/constants/app_theme.dart';
import 'package:quiz_test/src/feature/notes/domain/bloc/notes_bloc.dart';
import 'package:quiz_test/src/feature/notes/presentation/screens/edit_note.dart';
import 'package:quiz_test/src/feature/notes/presentation/widgets/note.dart';

class NoteOptionsWidget extends StatelessWidget {
  const NoteOptionsWidget({
    super.key,
    required this.widget,
  });

  final NoteWidget widget;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      color: AppColors.popupMenuBackground,
      child: Image.asset(
        'assets/icons/note_options.png',
      ),
      itemBuilder: (context) => [
        PopupMenuItem<dynamic>(
          onTap: () {
            context.read<NotesBloc>().add(
                  FetchSpecificNoteEvent(
                    id: widget.note.id ?? 0,
                  ),
                );
            Navigator.of(context).push(
              MaterialPageRoute<dynamic>(
                builder: (context) => EditNoteScreen(
                  note: widget.note,
                ),
              ),
            );
          },
          child: Row(
            children: [
              Image.asset(
                'assets/icons/note_edit.png',
              ),
              const SizedBox(width: 10),
              Text(
                'Изменить',
                style: GoogleFonts.robotoFlex(
                  textStyle: const TextStyle(
                    color: Color.fromRGBO(
                      247,
                      247,
                      251,
                      1,
                    ),
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
        PopupMenuItem<dynamic>(
          child: Row(
            children: [
              Image.asset(
                'assets/icons/note_pin.png',
              ),
              const SizedBox(width: 10),
              Text(
                'Закрепить',
                style: GoogleFonts.robotoFlex(
                  textStyle: const TextStyle(
                    color: Color.fromRGBO(
                      247,
                      247,
                      251,
                      1,
                    ),
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
        PopupMenuItem<dynamic>(
          onTap: () {
            showCupertinoDialog<dynamic>(
              barrierDismissible: true,
              context: context,
              builder: (_) => AlertDialog(
                actionsAlignment: MainAxisAlignment.spaceEvenly,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                backgroundColor: AppColors.popupMenuBackground,
                title: Text(
                  'Вы уверены, что хотите удалить заметку?',
                  style: TextStyles.popupTitleText,
                ),
                actions: [
                  FilledButton(
                    style: ButtonStyle(
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            5,
                          ),
                        ),
                      ),
                      backgroundColor: const MaterialStatePropertyAll(
                        AppColors.iconGrey,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Отменить',
                      style: GoogleFonts.robotoFlex(
                        textStyle: const TextStyle(
                          color: Color.fromRGBO(
                            53,
                            53,
                            58,
                            1,
                          ),
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  FilledButton(
                    style: ButtonStyle(
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            5,
                          ),
                        ),
                      ),
                      backgroundColor: const MaterialStatePropertyAll(
                        Color.fromRGBO(
                          252,
                          35,
                          87,
                          1,
                        ),
                      ),
                    ),
                    onPressed: () {
                      context.read<NotesBloc>().add(
                            DeleteNoteEvent(
                              id: widget.note.id ?? 0,
                            ),
                          );
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Удалить',
                      style: GoogleFonts.robotoFlex(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          child: Row(
            children: [
              Image.asset(
                'assets/icons/note_delete.png',
              ),
              const SizedBox(width: 10),
              Text(
                'Удалить',
                style: GoogleFonts.robotoFlex(
                  textStyle: const TextStyle(
                    color: Color.fromRGBO(
                      247,
                      247,
                      251,
                      1,
                    ),
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}