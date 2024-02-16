import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_test/src/core/constants/app_theme.dart';

class PreparationCardWidget extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final String? imagePath;
  final VoidCallback onCardTap;

  const PreparationCardWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.onCardTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onCardTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Center(
              child: Image.asset(
                imagePath ?? '',
                scale: 0.5,
              ),
            ),
            Center(
              child: Image.asset(
                'assets/images/shadow.png',
                scale: 0.5,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title ?? '',
                    style: TextStyles.quizCardTitleText,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    subtitle ?? '',
                    style: TextStyles.popupItemCancelText,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
