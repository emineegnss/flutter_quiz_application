import 'package:dio/dio.dart';
import 'package:flutter_application_question/model/question_model.dart';

import 'category_model.dart';

class Api {
  static Future<Dio> dioAuth() async {
    BaseOptions options = BaseOptions(
      baseUrl: "https://opentdb.com",
      headers: {"Accept": "application/json"},
      responseType: ResponseType.json,
    );

    return Dio(options);
  }

  static Future<List<CategoryModel>?> getCategories() async {
    try {
      Dio dio = await Api.dioAuth();
      Response response = await dio.get("/api_category.php");

      if (response.statusCode == 200) {
        final List<dynamic> items = response.data["trivia_categories"];
        return items.map((e) => CategoryModel.fromMap(e)).toList();
      }

      return null;
    } on DioError catch (_) {
      return null;
    }
  }

  static Future<List<QuestionModel>?> getQuestions({int amount = 10}) async {
    try {
      Dio dio = await Api.dioAuth();
      Response response = await dio.get("/api.php?amount=$amount");

      if (response.statusCode == 200) {
        final List<dynamic> items = response.data["results"];
        return items.map((e) => QuestionModel.fromMap(e)).toList();
      }

      return null;
    } on DioError catch (_) {
      return null;
    }
  }
}
