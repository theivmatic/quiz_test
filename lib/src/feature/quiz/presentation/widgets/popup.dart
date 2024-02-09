import 'package:flutter/material.dart';
import 'package:quiz_test/src/core/constants/app_theme.dart';
import 'package:quiz_test/src/core/router/navigation_screen.dart';

class PopUpWidget extends StatelessWidget {
  const PopUpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      color: AppColors.popupMenuBackground,
      child: const Icon(Icons.arrow_back_ios),
      itemBuilder: (context) => [
        PopupMenuItem<dynamic>(
          child: Text('Вы уверены, что хотите закончить сейчас?', style: TextStyles.popupTitleText,),
        ),
        PopupMenuItem<dynamic>(
          onTap: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute<dynamic>(
                builder: (context) => const NavigationScreen(),
              ),
            );
          },
          child: Container(
            width: 228,
            height: 28,
            decoration: BoxDecoration(
              color: AppColors.iconGrey,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Text(
                'Да',
                style: TextStyles.popupItemText,
              ),
            ),
          ),
        ),
        PopupMenuItem<dynamic>(
          onTap: () {},
          child: Container(
            width: 228,
            height: 28,
            decoration: BoxDecoration(
              color: AppColors.buttonPink,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Text(
                'Отмена',
                style: TextStyles.popupItemCancelText,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
