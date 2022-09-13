import 'package:flutter/material.dart';
import 'package:flutter_application_question/const.dart';
import 'package:flutter_application_question/controller.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DifficultyWidget extends GetView<QuizController> {
  const DifficultyWidget({Key? key, required this.quizModel, required this.isSelected}) : super(key: key);
  final QuizModel quizModel;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {
        if (controller.selected.value == quizModel.title) {
          controller.selected.value = "";
        } else {
          controller.selected.value = quizModel.title;
        }
      }),
      borderRadius: BorderRadius.circular(22),
      child: Container(
        margin: const EdgeInsets.only(left: 16, right: 16),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [const Color.fromARGB(255, 53, 110, 195).withOpacity(0.5), Colors.white.withOpacity(0.3)]),

          //gradient: LinearGradient(
          //colors: [Colors.red, Colors.white],
          //),
          borderRadius: BorderRadius.circular(16),
        ),
        child: ListTile(
          leading: Image.asset(
            quizModel.image,
            width: 40,
            height: 40,
          ),
          title: Text(
            quizModel.title,
            style: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.w600, fontSize: 13, color: Color.fromARGB(255, 238, 237, 237))),
          ),
          trailing: isSelected
              ? const Icon(
                  FeatherIcons.checkCircle,
                  color: Colors.white,
                )
              : const Icon(
                  FeatherIcons.circle,
                  color: Colors.white,
                ),
        ),
      ),
    );
  }
}
