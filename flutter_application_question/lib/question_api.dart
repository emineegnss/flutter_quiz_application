import 'package:dio/dio.dart';
import 'package:flutter_application_question/model/question_model.dart';

class QuestionApi {
  static Future<Dio> dioAuth() async {
    BaseOptions options = BaseOptions(
      baseUrl: "https://opentdb.com/api.php",
      headers: {"Accept": "application/json"},
      responseType: ResponseType.json,
    );

    return Dio(options);
  }

  static Future<List<QuestionModel>?> getQuestions(int category, String difficulty,
      {int amount = 10, String type = "multiple"}) async {
    try {
      Dio dio = await QuestionApi.dioAuth();
      Response response = await dio.get("/", queryParameters: {
        "amount": amount,
        "category": category,
        "type": type,
        "difficulty": difficulty.toLowerCase(),
      });

      if (response.statusCode == 200) {
        final List<dynamic> items = response.data["results"];
        return items.map((e) => QuestionModel.fromMap(e)).toList();
      }

      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
