import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_test/src/feature/presentation/screens/error_screen.dart';
import 'package:quiz_test/src/feature/presentation/screens/news_screen.dart';
import 'package:quiz_test/src/feature/presentation/screens/notes_screen.dart';
import 'package:quiz_test/src/feature/presentation/screens/quiz_theme_screen.dart';
import 'package:quiz_test/src/feature/presentation/screens/settings_screen.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  int _selectedIndex = 0;
  final screens = [
    const QuizThemeScreen(),
    const NotesScreen(),
  ];

  void _onItemTapped(int index) {
    setState(
      () {
        _selectedIndex = index;
        if (index == 0) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const QuizThemeScreen()));
        } else if (index == 1) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const NotesScreen()));
        } else if (index == 2) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const ErrorScreen()));
        } else if (index == 3) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const NewsScreen()));
        } else if (index == 4) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => SettingsScreen()));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      iconSize: 24,
      elevation: 0,
      backgroundColor: const Color.fromRGBO(27, 31, 41, 1),
      selectedItemColor: const Color.fromRGBO(251, 43, 93, 1),
      selectedFontSize: 11,
      selectedLabelStyle: GoogleFonts.robotoFlex(
        textStyle: const TextStyle(fontWeight: FontWeight.w500),
      ),
      unselectedItemColor: const Color.fromRGBO(131, 131, 131, 1),
      unselectedFontSize: 11,
      unselectedLabelStyle: GoogleFonts.robotoFlex(
        textStyle: const TextStyle(fontWeight: FontWeight.w500),
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
