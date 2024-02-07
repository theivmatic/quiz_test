import 'package:flutter/material.dart';
import 'package:quiz_test/src/core/constants/app_theme.dart';
import 'package:quiz_test/src/feature/preparation/screens/preparations_screen.dart';
import 'package:quiz_test/src/feature/news/screens/news_screen.dart';
import 'package:quiz_test/src/feature/notes/screens/notes_screen.dart';
import 'package:quiz_test/src/feature/quiz/screens/quiz_theme_screen.dart';
import 'package:quiz_test/src/feature/settings/screens/settings_screen.dart';

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
              MaterialPageRoute(builder: (context) => const PreparationsScreen()));
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
      backgroundColor: AppColors.darkBackground,
      selectedItemColor: AppColors.buttonPink,
      selectedFontSize: 11,
      selectedLabelStyle: TextStyles.navbarLabel,
      unselectedItemColor: AppColors.lightGray,
      unselectedFontSize: 11,
      unselectedLabelStyle: TextStyles.navbarLabel,
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
