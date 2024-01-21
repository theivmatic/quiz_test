import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
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
          ],
        ),
      ),
    );
  }
}
