import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_test/src/core/constants/app_theme.dart';
import 'package:quiz_test/src/feature/notes/domain/bloc/notes_bloc.dart';
import 'package:quiz_test/src/feature/notes/presentation/screens/add_note_screen.dart';
import 'package:quiz_test/src/feature/notes/presentation/screens/note_details.dart';

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
                  return GestureDetector(
                    onTap: () {
                      context.read<NotesBloc>().add(
                            FetchSpecificNoteEvent(
                              id: state.note[index].id ?? 0,
                            ),
                          );
                      Navigator.of(context).push(
                        MaterialPageRoute<dynamic>(
                          builder: (context) => const NoteDetailsScreen(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 76,
                            height: 76,
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          SizedBox(
                            width: 211,
                            height: 77,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  state.note[index].movieTitle,
                                  style: GoogleFonts.robotoFlex(
                                    textStyle: const TextStyle(
                                      color: Color.fromRGBO(247, 247, 251, 1),
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Text(
                                  state.note[index].comment,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.robotoFlex(
                                    textStyle: const TextStyle(
                                      color: Color.fromRGBO(189, 193, 203, 1),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 77,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                PopupMenuButton(
                                  shape: BeveledRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  color: AppColors.popupMenuBackground,
                                  child: Image.asset(
                                    'assets/icons/note_options.png',
                                  ),
                                  itemBuilder: (context) => [
                                    PopupMenuItem<dynamic>(
                                      onTap: () {},
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
                                            actionsAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                            backgroundColor:
                                                AppColors.popupMenuBackground,
                                            title: Text(
                                              'Вы уверены, что хотите удалить заметку?',
                                              style: TextStyles.popupTitleText,
                                            ),
                                            actions: [
                                              FilledButton(
                                                style: ButtonStyle(
                                                  shape:
                                                      MaterialStatePropertyAll(
                                                    RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        5,
                                                      ),
                                                    ),
                                                  ),
                                                  backgroundColor:
                                                      const MaterialStatePropertyAll(
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
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              FilledButton(
                                                style: ButtonStyle(
                                                  shape:
                                                      MaterialStatePropertyAll(
                                                    RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        5,
                                                      ),
                                                    ),
                                                  ),
                                                  backgroundColor:
                                                      const MaterialStatePropertyAll(
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
                                                          id: state
                                                              .note[index].id!,
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
                                                      fontWeight:
                                                          FontWeight.w400,
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
                                ),
                                Image.asset('assets/icons/note_pinned.png'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          }
          return const CircularProgressIndicator();
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
