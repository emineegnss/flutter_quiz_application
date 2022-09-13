class QuizModel {
  final String title;
  final String image;
  final String type;
  QuizModel({required this.image, required this.title, required this.type});
}

class Const {
  static final vote = <QuizModel>[
    QuizModel(image: "assets/Thinking-Emoji-PNG-Pic.png", title: "Easy", type: "diffuculty"),
    QuizModel(image: "assets/Thinking-Emoji-PNG-HD.png", title: "Medium", type: "diffuculty"),
    QuizModel(image: "assets/hard.png", title: "Hard", type: "diffuculty"),
  ];
}
