import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsTileWidget extends StatelessWidget {
  final String tileText;
  final onTap;

  const SettingsTileWidget(
      {super.key, required this.tileText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Text(
          tileText,
          style: GoogleFonts.robotoFlex(
            textStyle: const TextStyle(
              color: Color.fromRGBO(247, 247, 251, 1),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
