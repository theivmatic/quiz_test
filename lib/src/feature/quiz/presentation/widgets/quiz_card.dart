import 'package:flutter/material.dart';

class QuizCardWidget extends StatelessWidget {
  final String? title;
  final int? difficulty;
  final String? imagePath;

  const QuizCardWidget({
    super.key,
    required this.title,
    required this.difficulty,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Stack(
            children: [
              Image.asset(imagePath ?? ''),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title ?? ''),
                  Row(
                    children: [
                      Text('Сложность'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
