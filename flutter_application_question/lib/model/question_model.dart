import 'dart:convert';

import 'package:flutter/foundation.dart';

class QuestionModel {
  final String category;
  final String type;
  final String difficulty;
  final String question;
  final String correctAnswer;
  List<String> incorrectAnswers;
  QuestionModel({
    required this.category,
    required this.type,
    required this.difficulty,
    required this.question,
    required this.correctAnswer,
    required this.incorrectAnswers,
  });

  QuestionModel copyWith({
    String? category,
    String? type,
    String? difficulty,
    String? question,
    String? correctAnswer,
    List<String>? incorrectAnswers,
  }) {
    return QuestionModel(
      category: category ?? this.category,
      type: type ?? this.type,
      difficulty: difficulty ?? this.difficulty,
      question: question ?? this.question,
      correctAnswer: correctAnswer ?? this.correctAnswer,
      incorrectAnswers: incorrectAnswers ?? this.incorrectAnswers,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'category': category,
      'type': type,
      'difficulty': difficulty,
      'question': question,
      'correct_answer': correctAnswer,
      'incorrect_answers': incorrectAnswers,
    };
  }

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      category: map['category'] as String,
      type: map['type'] as String,
      difficulty: map['difficulty'] as String,
      question: map['question'] as String,
      correctAnswer: map['correct_answer'] as String,
      incorrectAnswers: List<String>.from(
        (map['incorrect_answers'] as List<dynamic>),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestionModel.fromJson(String source) => QuestionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'QuestionModel(category: $category, type: $type, difficulty: $difficulty, question: $question, correctAnswer: $correctAnswer, incorrectAnswers: $incorrectAnswers)';
  }

  @override
  bool operator ==(covariant QuestionModel other) {
    if (identical(this, other)) return true;

    return other.category == category &&
        other.type == type &&
        other.difficulty == difficulty &&
        other.question == question &&
        other.correctAnswer == correctAnswer &&
        listEquals(other.incorrectAnswers, incorrectAnswers);
  }

  @override
  int get hashCode {
    return category.hashCode ^
        type.hashCode ^
        difficulty.hashCode ^
        question.hashCode ^
        correctAnswer.hashCode ^
        incorrectAnswers.hashCode;
  }
}
