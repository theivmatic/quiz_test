import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_test/src/core/constants/app_theme.dart';

class QuestionTileWidget extends StatelessWidget {
  final String? questionText;

  const QuestionTileWidget({
    super.key,
    required this.questionText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 10.h,
      ),
      child: Container(
        height: 336.h,
        decoration: BoxDecoration(
          color: AppColors.popupMenuBackground,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(20.dg),
            child: Text(
              questionText ?? '',
              style: TextStyles.factNumber,
            ),
          ),
        ),
      ),
    );
  }
}
