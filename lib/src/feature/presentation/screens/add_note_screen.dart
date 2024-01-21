import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_test/src/feature/presentation/bloc/notes/notes_bloc.dart';
import 'package:quiz_test/src/feature/presentation/screens/notes_screen.dart';
import 'package:quiz_test/src/feature/presentation/widgets/bottom_button.dart';

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
        backgroundColor: const Color.fromRGBO(27, 31, 41, 1),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: const Color.fromRGBO(199, 201, 204, 1),
        ),
        title: Text(
          'Новая заметка',
          style: GoogleFonts.robotoFlex(
            textStyle: const TextStyle(
                color: Color.fromRGBO(247, 247, 251, 1),
                fontSize: 19,
                fontWeight: FontWeight.w700),
          ),
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
      backgroundColor: const Color.fromRGBO(27, 31, 41, 1),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: _title,
              decoration: InputDecoration(
                hintText: 'Название фильма или сериала',
                hintStyle: GoogleFonts.robotoFlex(
                  textStyle: const TextStyle(
                    color: Color.fromRGBO(131, 131, 131, 1),
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
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
                hintStyle: GoogleFonts.robotoFlex(
                  textStyle: const TextStyle(
                    color: Color.fromRGBO(131, 131, 131, 1),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
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
                hintStyle: GoogleFonts.robotoFlex(
                  textStyle: const TextStyle(
                    color: Color.fromRGBO(131, 131, 131, 1),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
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
                hintStyle: GoogleFonts.robotoFlex(
                  textStyle: const TextStyle(
                    color: Color.fromRGBO(131, 131, 131, 1),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                disabledBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
              ),
            ),
            BlocBuilder<NotesBloc, NotesBlocState>(builder: (context, state) {
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
                    Navigator.of(context).pop(
                      MaterialPageRoute(
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
            })
          ],
        ),
      ),
    );
  }
}
