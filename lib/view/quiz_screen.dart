import 'package:flutter/material.dart';
import 'package:quiz/models/questionsExemplos.dart';
import 'package:quiz/models/quiz_logic.dart';
import 'package:quiz/view/score_sceen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Icon> scoreIcons = [];
  QuizLogic quizLogic = QuizLogic(questions: listQuestions);

  List<int> questions = [];
  int count = 0;
  int numberQuestion = 0;
  int score = 0;

  void initializeQuiz() {
    questions = quizLogic.randomQuestion();
    numberQuestion = questions[count];
  }

  void processAnswer(bool userAnswer) {
    bool isCorrect =
        quizLogic.questions[numberQuestion].questionAnswer == userAnswer;

    setState(() {
      scoreIcons.add(
        Icon(
          isCorrect ? Icons.done : Icons.close,
          color: isCorrect ? Colors.green : Colors.red,
        ),
      );

      if (isCorrect) {
        score++;
      }

      if (count == questions.length - 1) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ResultScreen(
                    score: score, totalQuestions: questions.length)));
        return;
      }

      count++;
      numberQuestion = questions[count];
    });
  }

  @override
  void initState() {
    super.initState();
    initializeQuiz();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 6,
              child: Center(
                child: Text(quizLogic.questions[numberQuestion].questionText,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    )),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: ElevatedButton(
                  onPressed: () => processAnswer(true),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('True'),
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: ElevatedButton(
                    onPressed: () => processAnswer(false),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('False'),
                  ),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: scoreIcons,
            ),
          ],
        ));
  }
}
