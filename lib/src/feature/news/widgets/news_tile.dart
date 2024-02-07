import 'package:flutter/material.dart';
import 'package:quiz_test/src/core/constants/app_theme.dart';

class NewsTileWidget extends StatelessWidget {
  final VoidCallback onTap;

  const NewsTileWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Container(
          width: 343,
          height: 206,
          decoration: BoxDecoration(
            color: AppColors.popupMenuBackground,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Image.asset('assets/images/news_images/news_image5.png'),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        'Новые «Бременские музыканты»: фантазия с эффектом «зловещей долины»'),
                    SizedBox(height: 5),
                    Text('22 декабря • читать 4 минуты'),
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
