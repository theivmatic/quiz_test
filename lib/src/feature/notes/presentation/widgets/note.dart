import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_test/src/core/constants/app_theme.dart';
import 'package:quiz_test/src/feature/notes/domain/bloc/notes_bloc.dart';
import 'package:quiz_test/src/feature/notes/domain/models/note_model.dart';
import 'package:quiz_test/src/feature/notes/presentation/screens/note_details.dart';
import 'package:quiz_test/src/feature/notes/presentation/widgets/note_options.dart';

class NoteWidget extends StatefulWidget {
  final Note note;

  const NoteWidget({
    super.key,
    required this.note,
  });

  @override
  State<NoteWidget> createState() => _NoteWidgetState();
}

class _NoteWidgetState extends State<NoteWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<NotesBloc>().add(
              FetchSpecificNoteEvent(
                id: widget.note.id ?? 0,
              ),
            );
        Navigator.of(context).push(
          MaterialPageRoute<dynamic>(
            builder: (context) => NoteDetailsScreen(
              note: widget.note,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 76.w,
              height: 76.h,
              constraints: BoxConstraints.loose(
                Size(76.w, 76.h),
              ),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(4.r),
              ),
              // child: Image.asset(widget.imagePath),
              // child: Image.file(
              //   widget.image ?? File(''),
              // ),
            ),
            SizedBox(
              width: 211.w,
              height: 77.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.note.movieTitle,
                    style: TextStyles.factNumber,
                  ),
                  Text(
                    widget.note.comment,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.newsTileDateTime,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 77.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NoteOptionsWidget(widget: widget),
                  if (widget.note.isPinned)
                    Image.asset('assets/icons/note_pinned.png')
                  else
                    const SizedBox(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
