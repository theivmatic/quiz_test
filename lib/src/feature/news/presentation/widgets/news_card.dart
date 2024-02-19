import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_test/src/core/constants/app_theme.dart';

class NewsCardWidget extends StatelessWidget {
  final String? title;
  final String? imagePath;
  final String? date;
  final String? timeToRead;
  final VoidCallback onCardTap;

  const NewsCardWidget({
    super.key,
    required this.onCardTap,
    required this.imagePath,
    required this.date,
    required this.timeToRead,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 20.h,
      ),
      child: InkWell(
        onTap: onCardTap,
        child: Center(
          child: Container(
            width: 343.w,
            decoration: BoxDecoration(
              color: AppColors.popupMenuBackground,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Column(
              children: [
                Image.asset(
                  imagePath ?? '',
                  scale: 0.2.w,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title ?? '',
                        style: TextStyles.newsTileTitle,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        '$date • читать $timeToRead',
                        style: TextStyles.newsTileDateTime,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
