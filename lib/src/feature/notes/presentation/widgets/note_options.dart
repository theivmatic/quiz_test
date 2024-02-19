import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_test/src/core/constants/app_theme.dart';
import 'package:quiz_test/src/feature/notes/data/databases/notes_database.dart';
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
        borderRadius: BorderRadius.circular(6.r),
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
              SizedBox(width: 10.w),
              Text(
                'Изменить',
                style: TextStyles.editNoteText,
              ),
            ],
          ),
        ),
        PopupMenuItem<dynamic>(
          onTap: () async {
            await NotesDatabase.instance.pinNote(note: widget.note);
            // widget.note.isPinned = !widget.note.isPinned;
            log(widget.note.isPinned.toString());
          },
          child: Row(
            children: [
              if (widget.note.isPinned) Image.asset(
                'assets/icons/note_unpin.png',
              ) else Image.asset(
                'assets/icons/note_pin.png',
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                'Закрепить',
                style: TextStyles.editNoteText,
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
                  borderRadius: BorderRadius.circular(
                    16.r,
                  ),
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
                            5.r,
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
                      style: TextStyles.popupItemText,
                    ),
                  ),
                  FilledButton(
                    style: ButtonStyle(
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            5.r,
                          ),
                        ),
                      ),
                      backgroundColor: const MaterialStatePropertyAll(
                        AppColors.buttonPink,
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
                      style: TextStyles.popupItemCancelText,
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
              SizedBox(
                width: 10.w,
              ),
              Text(
                'Удалить',
                style: TextStyles.editNoteText,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
