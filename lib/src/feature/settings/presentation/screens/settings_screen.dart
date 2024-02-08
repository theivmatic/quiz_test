import 'package:flutter/material.dart';
import 'package:quiz_test/src/core/constants/app_theme.dart';
import 'package:quiz_test/src/core/constants/urls.dart';
import 'package:quiz_test/src/core/widgets/bottom_navigation_bar.dart';
import 'package:quiz_test/src/feature/settings/presentation/widgets/settngs_tile.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatefulWidget {

  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final InAppReview inAppReview = InAppReview.instance;

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
            onTap: () {
              launchUrl(
                AppUrls.privacyPolicy,
                mode: LaunchMode.externalApplication,
              );
            },
          ),
          const Divider(
            color: AppColors.settingsDivider,
          ),
          SettingsTileWidget(
            tileText: 'Пользовательское соглашение',
            onTap: () {
              launchUrl(
                AppUrls.userAgreement,
                mode: LaunchMode.externalApplication,
              );
            },
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
