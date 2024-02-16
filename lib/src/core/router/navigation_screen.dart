import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_test/src/core/constants/app_theme.dart';
import 'package:quiz_test/src/feature/news/presentation/screens/news_screen.dart';
import 'package:quiz_test/src/feature/notes/presentation/screens/notes_screen.dart';
import 'package:quiz_test/src/feature/preparation/presentation/screens/preparations_screen.dart';
import 'package:quiz_test/src/feature/quiz/presentation/screens/quiz_theme_screen.dart';
import 'package:quiz_test/src/feature/settings/presentation/screens/settings_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedIndex = 0;

  static final List<Widget> screens = [
    const QuizThemeScreen(),
    const NotesScreen(),
    const PreparationsScreen(),
    const NewsScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 24.h,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        elevation: 0,
        backgroundColor: AppColors.darkBackground,
        selectedItemColor: AppColors.buttonPink,
        selectedFontSize: 11.sp,
        selectedLabelStyle: TextStyles.navbarLabel,
        unselectedItemColor: AppColors.lightGray,
        unselectedFontSize: 11.sp,
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
      ),
    );
  }
}
