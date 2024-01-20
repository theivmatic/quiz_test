import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/bottom_navigation_bar.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

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
      body: Column(
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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
