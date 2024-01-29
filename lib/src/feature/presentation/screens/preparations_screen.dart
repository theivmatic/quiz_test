import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_test/src/feature/presentation/screens/preparetion_card_screen.dart';
import 'package:quiz_test/src/feature/presentation/widgets/bottom_navigation_bar.dart';

class PreparationsScreen extends StatelessWidget {
  const PreparationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Подготовка',
          style: GoogleFonts.robotoFlex(
            textStyle: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color.fromRGBO(27, 31, 41, 1),
      ),
      backgroundColor: const Color.fromRGBO(27, 31, 41, 1),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => const  PreparationCardScreen()),
              );
            },
            child: Image.asset(
              'assets/images/card_topic.png',
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }
}
