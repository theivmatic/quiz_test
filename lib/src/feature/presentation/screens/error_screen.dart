import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_test/src/feature/presentation/widgets/bottom_button.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(27, 31, 41, 1),
      body: Column(
        children: [
          const SizedBox(height: 200),
          Center(
            child: Image.asset('assets/images/exclamation_point.png'),
          ),
          const SizedBox(height: 40),
          Text(
            'Кажется что-то пошло не так',
            style: GoogleFonts.robotoFlex(
              textStyle: const TextStyle(
                color: Color.fromRGBO(247, 247, 251, 1),
                fontSize: 19,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Попробуйте обновить страницу',
            style: GoogleFonts.robotoFlex(
              textStyle: const TextStyle(
                color: Color.fromRGBO(247, 247, 251, 1),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(height: 40),
          BottomButtonWidget(
            buttonText: 'Обновить',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
