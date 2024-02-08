import 'package:flutter/material.dart';
import 'package:quiz_test/src/core/constants/app_theme.dart';

class SettingsTileWidget extends StatelessWidget {
  final String tileText;
  final VoidCallback onTap;

  const SettingsTileWidget({
    super.key,
    required this.tileText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Text(
          tileText,
          style: TextStyles.settingsTileText,
        ),
      ),
    );
  }
}
