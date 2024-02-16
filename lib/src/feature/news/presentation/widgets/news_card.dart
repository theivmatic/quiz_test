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
    return InkWell(
      onTap: onCardTap,
      child: Center(
        child: Container(
          width: 343.w,
          height: 206.h,
          decoration: BoxDecoration(
            color: AppColors.popupMenuBackground,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Image.asset(imagePath ?? ''),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title ?? '',
                      style: TextStyles.newsTileTitle,
                    ),
                    const SizedBox(height: 5),
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
    );
  }
}
