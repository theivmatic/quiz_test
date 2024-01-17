import 'package:flutter/material.dart';

class BottomButtonWidget extends StatelessWidget {
  final String buttonText;

  const BottomButtonWidget({
    super.key,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(
          Color.fromRGBO(251, 43, 93, 1),
        ),
        fixedSize: MaterialStatePropertyAll(
          Size(343, 43),
        ),
        elevation: MaterialStatePropertyAll(0),
      ),
      child: Text(
        buttonText,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
