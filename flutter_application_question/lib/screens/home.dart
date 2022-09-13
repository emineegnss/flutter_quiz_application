import 'package:flutter/material.dart';
import 'package:flutter_application_question/category_widget.dart';
import 'package:flutter_application_question/controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'difficulty.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

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
                "CATEGORY SELECT",
                style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 18, color: Color.fromARGB(255, 221, 220, 220))),
              ),
              const SizedBox(
                height: 8,
              ),
              Expanded(
                child: Obx(
                  () => controller.isLoading.value
                      ? const Center(child: CircularProgressIndicator())
                      : ListView(children: [
                          ...controller.categories
                              .map(
                                (e) => Obx(
                                  () => AnimatedPadding(
                                    duration: const Duration(milliseconds: 500),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 8, horizontal: controller.selectedCategory.value == e.id ? 10 : 32),
                                    child: GestureDetector(
                                      onTap: () => controller.selectedCategory.value = e.id,
                                      //child: Text(e.name),
                                      child: CategoryWidget(
                                        categoryModel: e,
                                        isSelected: controller.selectedCategory.value == e.id,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ]),
                ),
              ),
            ],
          ),
        ),
        extendBody: true,
        bottomNavigationBar: Obx(() => SizedBox(
              height: 65,
              child: Padding(
                padding: const EdgeInsets.only(right: 25, left: 25, bottom: 18),
                child: controller.selectedCategory.value != -1
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(32),
                        child: BottomAppBar(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: const Color.fromARGB(232, 224, 226, 232),
                                minimumSize: const Size(60, 40),
                                shape: const StadiumBorder()),
                            onPressed: () {
                              Get.to(const DifficultyPage());
                              controller.selected.value = "";
                            },
                            child: Text(
                              "Next",
                              style: TextStyle(color: Colors.blue[900], fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ))
                    : null,
              ),
            )));
  }
}
