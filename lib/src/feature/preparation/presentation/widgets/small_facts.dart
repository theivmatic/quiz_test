import 'package:flutter/material.dart';

class SmallFactsWidget extends StatelessWidget {
  final String? title;
  final String? smallFact;
  final int itemCount;

  const SmallFactsWidget({
    super.key,
    required this.title,
    required this.smallFact,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title ?? ''),
        ListView.builder(
          itemCount: itemCount,
          itemBuilder: (context, index) => Text(smallFact ?? ''),
        ),
      ],
    );
  }
}
