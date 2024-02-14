import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_test/src/core/constants/app_theme.dart';
import 'package:quiz_test/src/feature/notes/domain/bloc/notes_bloc.dart';

class NoteDetailsScreen extends StatefulWidget {
  const NoteDetailsScreen({
    super.key,
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
                  // Image.file(_selectedImage),



                  
                  // GestureDetector(
                  //   onTap: _pickImageFromGallery,
                  //   child: Column(
                  //     children: [
                  //       Container(
                  //         width: 88,
                  //         height: 88,
                  //         decoration: BoxDecoration(
                  //           color: AppColors.answerBackground,
                  //           borderRadius: BorderRadius.circular(8),
                  //         ),
                  //         child: const Center(
                  //           child: Icon(Icons.photo_camera_outlined),
                  //         ),
                  //       ),
                  //       if (_selectedImage != null)
                  //         Image.file(_selectedImage!)
                  //       else
                  //         const SizedBox(),
                  //       const SizedBox(
                  //         height: 10,
                  //       ),
                  //       Text(
                  //         'Загрузить файл',
                  //         style: TextStyles.uploadImageText,
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // BlocBuilder<NotesBloc, NotesBlocState>(
                  //   builder: (context, state) {
                  //     return BottomButtonWidget(
                  //       buttonText: 'Сохранить',
                  //       onPressed: () {
                  //         if (_title.text.isNotEmpty && _comment.text.isNotEmpty) {
                  //           context.read<NotesBloc>().add(
                  //                 AddNoteEvent(
                  //                   movieTitle: _title.text,
                  //                   dutarion: _duration.text,
                  //                   comment: _comment.text,
                  //                   url: _url.text,
                  //                   movieImage: '',
                  //                 ),
                  //               );
                  //           context.read<NotesBloc>().add(
                  //                 const FetchNotesEvent(),
                  //               );
                  //           Navigator.of(context).pop(
                  //             MaterialPageRoute<dynamic>(
                  //               builder: (context) => const NotesScreen(),
                  //             ),
                  //           );
                  //         } else {
                  //           ScaffoldMessenger.of(context).showSnackBar(
                  //             SnackBar(
                  //               content: Text(
                  //                 'Поля название и комментарий должны быть заполнены'
                  //                     .toUpperCase(),
                  //               ),
                  //             ),
                  //           );
                  //         }
                  //       },
                  //     );
                  //   },
                  // ),
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
