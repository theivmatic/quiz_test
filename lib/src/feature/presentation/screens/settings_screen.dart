import 'package:flutter/material.dart';
import 'package:quiz_test/src/core/constants/app_theme.dart';
import 'package:quiz_test/src/feature/presentation/widgets/bottom_navigation_bar.dart';
import 'package:quiz_test/src/feature/presentation/widgets/settngs_tile.dart';
import 'package:in_app_review/in_app_review.dart';

class SettingsScreen extends StatelessWidget {
  final InAppReview inAppReview = InAppReview.instance;

  SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Настройки',
          style: TextStyles.appBarText,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.darkBackground,
      ),
      backgroundColor: AppColors.darkBackground,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SettingsTileWidget(
            tileText: 'Оценить приложение',
            onTap: () async {
              if (await inAppReview.isAvailable()) {
                inAppReview.requestReview();
              }
            },
          ),
          const Divider(
            color: AppColors.settingsDivider,
          ),
          SettingsTileWidget(
            tileText: 'О приложении',
            onTap: () {},
          ),
          const Divider(
            color: AppColors.settingsDivider,
          ),
          SettingsTileWidget(
            tileText: 'Политика конфиденциальности',
            onTap: () {},
          ),
          const Divider(
            color: AppColors.settingsDivider,
          ),
          SettingsTileWidget(
            tileText: 'Пользовательское соглашение',
            onTap: () {},
          ),
          const Divider(
            color: AppColors.settingsDivider,
          ),
          SettingsTileWidget(
            tileText: 'Обратная связь',
            onTap: () {},
          ),
          const Divider(
            color: AppColors.settingsDivider,
          ),
          SettingsTileWidget(
            tileText: 'Сброс статистики',
            onTap: () {},
          ),
          const Divider(
            color: AppColors.settingsDivider,
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }
}
