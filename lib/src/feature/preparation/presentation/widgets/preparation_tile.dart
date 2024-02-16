import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_test/src/core/constants/app_theme.dart';

class PreparationTileWidget extends StatelessWidget {
  final String? number;
  final String? text;
  final String? imagePath;
  final String? subtext;

  const PreparationTileWidget({
    super.key,
    required this.number,
    required this.text,
    this.imagePath,
    this.subtext,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10.h,
          ),
          Text(
            number ?? '',
            style: TextStyles.factNumber,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            text ?? '',
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
          if (subtext != null)
            Text(
              subtext!,
              style: TextStyles.factSubText,
            )
          else
            const SizedBox(),
        ],
      ),
    );
  }
}
