import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: 1,
      iconSize: 24,
      elevation: 0,
      backgroundColor: const Color.fromRGBO(27, 31, 41, 1),
      selectedItemColor: const Color.fromRGBO(251, 43, 93, 1),
      selectedFontSize: 11,
      selectedLabelStyle: GoogleFonts.robotoFlex(
        textStyle: const TextStyle(
            fontFamily: 'Roboto Flex', fontWeight: FontWeight.w500),
      ),
      unselectedItemColor: const Color.fromRGBO(131, 131, 131, 1),
      unselectedFontSize: 11,
      unselectedLabelStyle: GoogleFonts.robotoFlex(
        textStyle: const TextStyle(
            fontFamily: 'Roboto Flex', fontWeight: FontWeight.w500),
      ),
      showUnselectedLabels: true,
      items: const [
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/icons/book.png'),
          ),
          label: 'Тема',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/icons/notes.png'),
          ),
          label: 'Заметки',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/icons/hat.png'),
          ),
          label: 'Подготовка',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/icons/news.png'),
          ),
          label: 'Новости',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/icons/settings.png'),
          ),
          label: 'Настройки',
        ),
      ],
    );
  }
}
