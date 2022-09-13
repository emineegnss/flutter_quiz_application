import 'package:flutter/material.dart';

import 'package:flutter_application_question/controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../difficulty_widget.dart';
import 'questions_home.dart';

class DifficultyPage extends StatelessWidget {
  const DifficultyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(QuizController());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue[900],
          title: const Text(
            "QUİZAPP",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color.fromARGB(255, 200, 204, 225)),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/Blue Business Technology Atmosphere Poster Background Free Download.jpg"),
                fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              Lottie.asset(
                "assets/108535-emoji-with-question-marks.json",
                height: 200,
                width: 200,
              ),
              Text(
                "DİFFİCULTY SELECT",
                style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 18, color: Color.fromARGB(255, 221, 220, 220))),
              ),
              const SizedBox(
                height: 8,
              ),
              Expanded(
                child: ListView(children: [
                  ...controller.quizList
                      .where((p0) => p0.type == "diffuculty")
                      .map(
                        (e) => Obx(
                          () => AnimatedPadding(
                            duration: const Duration(milliseconds: 500),
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: controller.selected.value == e.title ? 10 : 32),
                            child: GestureDetector(
                              onTap: () => controller.selected.value = e.title,
                              child: DifficultyWidget(
                                quizModel: e,
                                isSelected: controller.selected.value == e.title,
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ]),
              ),
            ],
          ),
        ),
        extendBody: true,
        bottomNavigationBar: Obx(() => Row(
              children: [
                SizedBox(
                  height: 65,
                  child: Padding(
                      padding: const EdgeInsets.only(right: 25, left: 25, bottom: 18),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(32),
                          child: BottomAppBar(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: const Color.fromARGB(232, 224, 226, 232),
                                  minimumSize: const Size(140, 40),
                                  shape: const StadiumBorder()),
                              onPressed: () {
                                Get.back();
                              },
                              child: Text(
                                "Back",
                                style: TextStyle(color: Colors.blue[900], fontSize: 15, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ))),
                ),
                SizedBox(
                  height: 65,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 25, left: 25, bottom: 18),
                    child: controller.selected.isNotEmpty
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(32),
                            child: BottomAppBar(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: const Color.fromARGB(232, 224, 226, 232),
                                    minimumSize: const Size(140, 40),
                                    shape: const StadiumBorder()),
                                onPressed: () {
                                  Get.to(QuestionHome(
                                    categoryId: controller.selectedCategory.value,
                                    difficulty: controller.selected.value,
                                  ));
                                },
                                child: Text(
                                  "Next",
                                  style: TextStyle(color: Colors.blue[900], fontSize: 15, fontWeight: FontWeight.w600),
                                ),
                              ),
                            ))
                        : null,
                  ),
                )
              ],
            )));
  }
}
