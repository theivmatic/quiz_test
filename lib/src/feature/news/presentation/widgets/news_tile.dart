import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_test/src/core/constants/app_theme.dart';

class NewsTileWidget extends StatelessWidget {
  final String? newsTitle;
  final String? newsText;
  final String? imagePath;
  final String? newsSubtext;

  const NewsTileWidget({
    super.key,
    required this.newsTitle,
    required this.newsText,
    required this.imagePath,
    required this.newsSubtext,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10.h,
          ),
          Text(
            newsTitle ?? '',
            style: TextStyles.factNumber,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            newsText ?? '',
            style: TextStyles.factText,
          ),
          SizedBox(
            height: 10.h,
          ),
          if (imagePath != null)
            Center(child: Image.asset(imagePath!))
          else
            const SizedBox(),
          SizedBox(
            height: 5.h,
          ),
          Text(
            newsSubtext ?? '',
            style: TextStyles.factSubText,
          ),
        ],
      ),
    );
  }
}
