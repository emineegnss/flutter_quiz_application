import 'package:flutter/material.dart';
import 'package:flutter_application_question/question_controller.dart';
import 'package:flutter_application_question/question_tile.dart';
import 'package:get/get.dart';

class QuestionHome extends StatelessWidget {
  const QuestionHome({Key? key, required this.categoryId, required this.difficulty}) : super(key: key);
  final int categoryId;
  final String difficulty;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(QuestionController(categoryId, difficulty));

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue[900],
        title: Row(
          children: [
            const Text(
              "QUİZAPP",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color.fromARGB(255, 200, 204, 225)),
            ),
            SizedBox(
              width: 12,
            ),
            Obx(() => Text(controller.score.value.toString())),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/Fondos de Pantalla Azul.jpg"), fit: BoxFit.fill),
            ),
          ),
          Obx(
            () => controller.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : QuestionTile(question: controller.questions[controller.count.value]),
          )
        ],
      ),
    );
  }
}
