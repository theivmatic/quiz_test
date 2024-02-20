import 'package:flutter/material.dart';
import 'package:quiz_test/src/core/constants/app_theme.dart';
import 'package:quiz_test/src/core/screens/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future<dynamic>.delayed(const Duration(seconds: 4)).then(
      (value) => Navigator.of(context).pushReplacement(
        MaterialPageRoute<dynamic>(
          builder: (context) => const OnboardingScreen(),
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: Center(
        child: Image.asset('assets/images/splash_screen_image.png'),
      ),
    );
  }
}
