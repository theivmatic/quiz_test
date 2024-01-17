import 'package:flutter/material.dart';

class Quiz {
  final int? id;
  final int difficulty;
  final Widget image;

  Quiz({
    required this.id,
    required this.difficulty,
    required this.image,
  });

  factory Quiz.fromMap(Map<String, dynamic> json) => new Quiz(
        id: json['id'],
        difficulty: json['difficulty'],
        image: json['image'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'difficulty': difficulty,
      'image': image,
    };
  }
}
