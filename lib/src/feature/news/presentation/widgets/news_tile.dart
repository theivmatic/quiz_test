import 'package:flutter/material.dart';
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
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Text(
            newsTitle ?? '',
            style: TextStyles.factNumber,
          ),
          const SizedBox(height: 10),
          Text(
            newsText ?? '',
            style: TextStyles.factText,
          ),
          const SizedBox(height: 10),
          if (imagePath != null)
            Center(child: Image.asset(imagePath!))
          else
            const SizedBox(),
          const SizedBox(height: 5),
          Text(
            newsSubtext ?? '',
            style: TextStyles.factSubText,
          ),
        ],
      ),
    );
  }
}
