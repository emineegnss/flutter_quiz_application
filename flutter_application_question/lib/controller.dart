import 'package:flutter_application_question/category_api.dart';
import 'package:flutter_application_question/const.dart';
import 'package:flutter_application_question/model/category_model.dart';
import 'package:get/get.dart';

import 'model/question_model.dart';

class QuizController extends GetxController {
  final selected = "".obs;
  final selectedCategory = (-1).obs;

  final quizList = Const.vote.obs;
  final selectedAnswer = "".obs;
  final timerIsActive = false.obs;
  final questionList = <QuestionModel>[].obs;

  final isLoading = true.obs;

  final categories = <CategoryModel>[].obs;

  @override
  void onInit() async {
    isLoading.value = true;
    final result = await CategoryApi.getCategories();
    if (result != null) {
      categories.value = result;
    }
    isLoading.value = false;

    super.onInit();
  }
}
