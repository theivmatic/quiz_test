import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_test/src/feature/presentation/widgets/bottom_navigation_bar.dart';
import 'package:quiz_test/src/feature/presentation/widgets/settngs_tile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Настройки',
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SettingsTileWidget(
            tileText: 'Оценить приложение',
            onTap: () {},
          ),
          const Divider(
            color: Color.fromRGBO(51, 51, 51, 1),
          ),
          SettingsTileWidget(
            tileText: 'О приложении',
            onTap: () {},
          ),
          const Divider(
            color: Color.fromRGBO(51, 51, 51, 1),
          ),
          SettingsTileWidget(
            tileText: 'Политика конфиденциальности',
            onTap: () {},
          ),
          const Divider(
            color: Color.fromRGBO(51, 51, 51, 1),
          ),
          SettingsTileWidget(
            tileText: 'Пользовательское соглашение',
            onTap: () {},
          ),
          const Divider(
            color: Color.fromRGBO(51, 51, 51, 1),
          ),
          SettingsTileWidget(
            tileText: 'Обратная связь',
            onTap: () {},
          ),
          const Divider(
            color: Color.fromRGBO(51, 51, 51, 1),
          ),
          SettingsTileWidget(
            tileText: 'Сброс статистики',
            onTap: () {},
          ),
          const Divider(
            color: Color.fromRGBO(51, 51, 51, 1),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }
}
