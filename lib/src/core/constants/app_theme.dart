import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const font = GoogleFonts.robotoFlex;

abstract class AppColors {
  static const darkBackground = Color.fromRGBO(27, 31, 41, 1);
  static const buttonPink = Color.fromRGBO(251, 43, 93, 1);
  static const lightGray = Color.fromRGBO(131, 131, 131, 1);
  static const iconGrey = Color.fromRGBO(199, 201, 204, 1);
  static const settingsDivider = Color.fromRGBO(51, 51, 51, 1);
  static const divider = Color.fromRGBO(53, 53, 58, 1);
  static const popupMenuBackground = Color.fromRGBO(50, 49, 58, 1);

  //text colors
  static const textWhite = Color.fromRGBO(247, 247, 251, 1);
  static const textGrey = Color.fromRGBO(189, 193, 203, 1);
}

abstract class TextStyles {
  static final startScreenText = font(
    textStyle: const TextStyle(
      fontSize: 19,
      fontWeight: FontWeight.w700,
      color: AppColors.textWhite,
    ),
  );
  static final bottomButtonText = font(
    textStyle: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: AppColors.textWhite,
    ),
  );
  static final appBarText = font(
    textStyle: const TextStyle(
      fontSize: 19,
      fontWeight: FontWeight.w700,
      color: AppColors.textWhite,
    ),
  );
  static final hintBigText = font(
    textStyle: const TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w500,
      color: AppColors.lightGray,
    ),
  );
  static final hintMediumText = font(
    textStyle: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.lightGray,
    ),
  );
  static final errorText = font(
    textStyle: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColors.textWhite,
    ),
  );
  static final factNumber = font(
    textStyle: const TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w500,
      color: AppColors.textWhite,
    ),
  );
  static final factText = font(
    textStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColors.textGrey,
    ),
  );
  static final factSubText = font(
    textStyle: const TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.w400,
      color: AppColors.textGrey,
    ),
  );
  static final settingsTileText = font(
    textStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColors.textWhite,
    ),
  );
  static final navbarLabel = font(
    textStyle: const TextStyle(
      fontWeight: FontWeight.w500,
    ),
  );
}