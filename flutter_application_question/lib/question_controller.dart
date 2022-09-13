import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_question/model/question_model.dart';
import 'package:flutter_application_question/question_api.dart';
import 'package:flutter_application_question/screens/home.dart';
import 'package:get/get.dart';

import 'model/quiz_model.dart';

class QuestionController extends GetxController {
  final questions = <QuestionModel>[].obs;
  final selectedAnswer = "".obs;
  final timerIsActive = false.obs;
  final questionList = <QuestionModel>[].obs;
  final score = 0.obs;

  final isLoading = true.obs;
  final count = 0.obs;
  int categoryID;
  String difficulty;

  QuestionController(this.categoryID, this.difficulty);
  Color getColor(String title, bool isCorrect) => selectedAnswer.value == title
      ? (timerIsActive.value ? Color.fromARGB(192, 145, 144, 144) : (isCorrect ? Colors.green : Colors.red))
      : Colors.transparent;

  Timer? timer;
  @override
  void onInit() async {
    final result = await QuestionApi.getQuestions(categoryID, difficulty);

    if (result != null) {
      for (final dataa in result) {
        dataa.incorrectAnswers.add(dataa.correctAnswer);
        dataa.incorrectAnswers.shuffle();
      }
      result.shuffle();
      questionList.value = result;

      questions.value = result;
    }

    isLoading.value = false;

    super.onInit();
  }

  void scoreboard(bool isCorrect, String title) {
    if (timerIsActive.value) {
      return;
    }
    timer?.cancel();
    timerIsActive.value = true;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timer.tick == 2) {
        timerIsActive.value = false;
        if (isCorrect) {
          score.value += 10;
        } else {
          score.value = max(score.value -= 5, 0);
        }
      }
      if (timer.tick == 4) {
        selectedAnswer.value = "";
        timer.cancel();
        count.value++;
        counter();
      }
    });
    selectedAnswer.value = title;
  }

  Future? counter() {
    if (count == 9) {
      return Get.to(MyHomePage());
    }
  }
}
