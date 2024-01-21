import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_test/src/feature/domain/models/note_model.dart';
import 'package:quiz_test/src/feature/presentation/bloc/notes/notes_bloc.dart';
import 'package:quiz_test/src/feature/presentation/screens/add_note_screen.dart';

import '../widgets/bottom_navigation_bar.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Заметки',
          style: GoogleFonts.robotoFlex(
            textStyle: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color.fromRGBO(27, 31, 41, 1),
      ),
      backgroundColor: const Color.fromRGBO(27, 31, 41, 1),
      body: BlocBuilder<NotesBloc, NotesBlocState>(
        builder: (context, state) {
          if (state is NotesBlocInitialState) {
            context.read<NotesBloc>().add(const FetchNotesEvent());
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
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(
                  color: Color.fromRGBO(53, 53, 58, 1),
                ),
                scrollDirection: Axis.vertical,
                itemCount: state.note.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          Container(
                            width: 76,
                            height: 76,
                            decoration: const BoxDecoration(
                              color: Colors.amber,
                            ),
                          ),
                          Column(
                            children: [
                              Text(''),
                              Text(''),
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Image.asset(''),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Image.asset(''),
                              ),
                            ],
                          ),
                        ],
                      ));
                },
              );
            }
          }
          return const Placeholder();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const AddNoteScreen()));
        },
        backgroundColor: const Color.fromRGBO(251, 43, 93, 1),
        child: const Icon(
          Icons.add,
          color: Color.fromRGBO(199, 201, 204, 1),
          size: 24,
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }
}
