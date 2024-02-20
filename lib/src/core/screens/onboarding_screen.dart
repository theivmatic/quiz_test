import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_test/src/core/constants/app_theme.dart';
import 'package:quiz_test/src/core/router/navigation_screen.dart';
import 'package:quiz_test/src/core/widgets/bottom_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: Column(
        children: [
          const SizedBox(height: 10),
          Center(
            child: Image.asset(
              'assets/images/start_screen_background_image.png',
            ),
          ),
          Text(
            'Насколько вы хорошо знаете\n русские сериалы?',
            textAlign: TextAlign.center,
            style: GoogleFonts.robotoFlex(
              textStyle: TextStyles.startScreenText,
            ),
          ),
          const SizedBox(height: 30),
          BottomButtonWidget(
            buttonText: 'Продолжить',
            onPressed: () async {
              final onboardingToken = await SharedPreferences.getInstance();
              await onboardingToken.setBool('onboarding', true);

              if (!mounted) return;
              await Navigator.of(context).pushReplacement(
                MaterialPageRoute<dynamic>(
                  builder: (context) => const NavigationScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
