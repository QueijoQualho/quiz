import 'package:flutter/material.dart';
import 'package:quiz/models/question.dart';
import 'package:quiz/view/result_sceen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Icon> scoreIcons = [];
  List<Questions> questions = [
    Questions(
        questionText: "Qual foi o primeiro homem a pisar na Lua",
        questionAnswer: true),
    Questions(questionText: "oie", questionAnswer: false),
    Questions(questionText: "asdas", questionAnswer: false),
    Questions(questionText: "aaaaa", questionAnswer: true),
    Questions(questionText: "sadasfasf", questionAnswer: true)
  ];

  int i = 0;
  int score = 0;

  void processAnswer(bool userAnswer) {
    bool isCorrect = questions[i].questionAnswer == userAnswer;

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

      if (i == questions.length - 1) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ResultScreen(
                    score: score, totalQuestions: questions.length)));
        return;
      }

      i++;
    });
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
                child: Text(questions[i].questionText,
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
                  child: const Text('True'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    onPrimary: Colors.white,
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: ElevatedButton(
                    onPressed: () => processAnswer(true),
                    child: const Text('False'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.redAccent,
                      onPrimary: Colors.white,
                    ),
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
