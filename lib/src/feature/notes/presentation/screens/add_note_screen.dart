import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_test/src/core/constants/app_theme.dart';
import 'package:quiz_test/src/core/widgets/bottom_button.dart';
import 'package:quiz_test/src/feature/notes/domain/bloc/notes_bloc.dart';
import 'package:quiz_test/src/feature/notes/presentation/screens/notes_screen.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final TextEditingController _title = TextEditingController();
  final TextEditingController _duration = TextEditingController();
  final TextEditingController _comment = TextEditingController();
  final TextEditingController _url = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.darkBackground,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: AppColors.iconGrey,
        ),
        title: Text(
          'Новая заметка',
          style: TextStyles.appBarText,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset('assets/icons/pin_icon.png'),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset('assets/icons/delete_icon.png'),
          ),
        ],
      ),
      backgroundColor: AppColors.darkBackground,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: _title,
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
              controller: _duration,
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
              controller: _comment,
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
              controller: _url,
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
            BlocBuilder<NotesBloc, NotesBlocState>(
              builder: (context, state) {
                return BottomButtonWidget(
                  buttonText: 'Сохранить',
                  onPressed: () {
                    if (_title.text.isNotEmpty && _comment.text.isNotEmpty) {
                      context.read<NotesBloc>().add(
                            AddNoteEvent(
                              movieTitle: _title.text,
                              dutarion: _duration.text,
                              comment: _comment.text,
                              url: _url.text,
                              movieImage: '',
                            ),
                          );
                      context.read<NotesBloc>().add(
                            const FetchNotesEvent(),
                          );
                      Navigator.of(context).pop(
                        MaterialPageRoute<dynamic>(
                          builder: (context) => const NotesScreen(),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Поля название и комментарий должны быть заполнены'
                                .toUpperCase(),
                          ),
                        ),
                      );
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
