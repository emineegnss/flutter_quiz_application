import 'package:flutter/material.dart';
import 'package:flutter_application_question/question_controller.dart';
import 'package:get/get.dart';

import 'model/question_model.dart';

class QuestionTile extends GetView<QuestionController> {
  const QuestionTile({Key? key, required this.question}) : super(key: key);
  final QuestionModel question;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      margin: const EdgeInsets.only(left: 20, right: 20, top: 110),
      alignment: Alignment.center,
      width: Get.width,
      height: 410,
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.white30),
          borderRadius: BorderRadius.circular(16),
          color: Colors.blue[900]),
      child: Column(
        children: [
          Text(
            question.question,
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 8),
          const Divider(thickness: 3),
          const SizedBox(height: 8),
          ...question.incorrectAnswers.map((answer) {
            final isCorrect = question.correctAnswer == answer;
            return GestureDetector(
              onTap: () {
                controller.scoreboard(isCorrect, answer);
              },
              child: AnswerTile(title: answer, isCorrect: isCorrect),
            );
          }).toList(),
          // AnswerTile(title: question.correctAnswer, isCorrect: true),
        ],
      ),
    );
  }
}

class AnswerTile extends GetView<QuestionController> {
  const AnswerTile({
    Key? key,
    required this.title,
    required this.isCorrect,
  }) : super(key: key);
  final String title;
  final bool isCorrect;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 16),
        alignment: Alignment.center,
        width: Get.width,
        decoration: BoxDecoration(
          color: controller.getColor(title, isCorrect),
          border: Border.all(width: 1, color: Color.fromARGB(187, 255, 255, 255)),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
