import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_test/src/core/constants/app_theme.dart';
import 'package:quiz_test/src/feature/notes/domain/bloc/notes_bloc.dart';
import 'package:quiz_test/src/feature/notes/presentation/screens/add_note_screen.dart';
import 'package:quiz_test/src/feature/notes/presentation/widgets/note.dart';

class NotesScreen extends StatefulWidget {
  // final File? image;

  const NotesScreen({
    super.key,
    // required this.image,
  });

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  @override
  // void initState() {
  //   context.read<NotesBloc>().add(const FetchNotesEvent());
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Заметки',
          style: TextStyles.appBarText,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.darkBackground,
      ),
      backgroundColor: AppColors.darkBackground,
      body: BlocBuilder<NotesBloc, NotesBlocState>(
        builder: (context, state) {
          if (state is NotesBlocInitialState) {
            context.read<NotesBloc>().add(
                  const FetchNotesEvent(),
                );
          }
          if (state is DisplayNotes) {
            if (state.note.isEmpty) {
              return Column(
                children: [
                  const SizedBox(height: 40),
                  Center(
                    child: Image.asset('assets/images/notes_image.png'),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Ваш список пока пуст',
                    style: GoogleFonts.robotoFlex(
                      textStyle: const TextStyle(
                        color: Color.fromRGBO(247, 247, 251, 1),
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Нажмите «+», чтобы создать заметку',
                    style: GoogleFonts.robotoFlex(
                      textStyle: const TextStyle(
                        color: Color.fromRGBO(189, 193, 203, 1),
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(right: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset('assets/images/arrow_to_button.png'),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return ListView.separated(
                separatorBuilder: (context, index) => const Divider(
                  color: AppColors.divider,
                ),
                itemCount: state.note.length,
                itemBuilder: (context, index) {
                  return NoteWidget(
                    note: state.note[index],
                  );
                },
              );
            }
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute<dynamic>(
              builder: (context) => const AddNoteScreen(),
            ),
          );
        },
        backgroundColor: AppColors.buttonPink,
        child: const Icon(
          Icons.add,
          color: AppColors.iconGrey,
          size: 24,
        ),
      ),
    );
  }
}
