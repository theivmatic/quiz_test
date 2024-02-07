import 'package:flutter/material.dart';
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
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Text(
            number ?? '',
            style: TextStyles.factNumber,
          ),
          const SizedBox(height: 10),
          Text(
            text ?? '',
            style: TextStyles.factText,
          ),
          const SizedBox(height: 10),
          imagePath != null ? Image.asset(imagePath!) : const SizedBox(),
          const SizedBox(height: 5),
          subtext != null
              ? Text(
                  subtext!,
                  style: TextStyles.factSubText,
                )
              : const SizedBox(),
          
        ],
      ),
    );
  }
}
