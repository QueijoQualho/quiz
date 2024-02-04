import 'dart:math';
import 'package:quiz/models/question.dart';

class QuizLogic {
  List<Questions> questions;

  QuizLogic({required this.questions});

  List<int> randomQuestion() {
    List<int> usedQuestions = [];

    while (usedQuestions.length < 10) {
      int random = Random().nextInt(questions.length);

      while (usedQuestions.contains(random)) {
        random = Random().nextInt(10) ;
      }

      usedQuestions.add(random);
    }
    return usedQuestions;
  }

}
