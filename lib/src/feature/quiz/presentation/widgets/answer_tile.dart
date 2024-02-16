import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_test/src/core/constants/app_theme.dart';

class AnswerTileWidget extends StatelessWidget {
  final String? answerText;
  final Color? answerColor;
  final VoidCallback onTap;

  const AnswerTileWidget({
    super.key,
    required this.answerText,
    required this.answerColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 43.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: answerColor,
          ),
          child: Center(
            child: Text(
              answerText ?? '',
              style: TextStyles.bottomButtonText,
            ),
          ),
        ),
      ),
    );
  }
}




















// class AnswerTileWidget extends StatelessWidget {
//   final String? answerText;
//   final bool? isCorrect;
//   final VoidCallback onTap;
//   final Color color;

//   const AnswerTileWidget({
//     super.key,
//     required this.answerText,
//     required this.isCorrect,
//     required this.onTap,
//     required this.color,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(15),
//       child: GestureDetector(
//         onTap: onTap,
//         child: Container(
//           height: 43,
//           decoration: BoxDecoration(
//             color: color,
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: Center(
//             child: Text(
//               answerText ?? '',
//               style: TextStyles.bottomButtonText,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
