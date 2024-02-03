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
        questionText: "A teoria da relatividade foi proposta por Isaac Newton",
        questionAnswer: false),
    Questions(
        questionText: "A inteligência artificial pode sentir emoções",
        questionAnswer: false),
    Questions(
        questionText:
            "A programação em lógica difusa é uma abordagem para resolver problemas complexos",
        questionAnswer: true),
    Questions(
        questionText:
            "A quantidade de números irracionais é maior do que os números racionais",
        questionAnswer: true),
    Questions(
        questionText: "A revolução industrial teve início no século XVIII",
        questionAnswer: true),
    Questions(
        questionText:
            "A energia escura é responsável pela expansão acelerada do universo",
        questionAnswer: true),
    Questions(
        questionText:
            "O ácido desoxirribonucleico (DNA) está presente apenas em células animais",
        questionAnswer: false),
    Questions(
        questionText:
            "O método científico é uma abordagem infalível para obter conhecimento absoluto",
        questionAnswer: false),
    Questions(
        questionText:
            "A teoria do caos afirma que sistemas complexos são totalmente previsíveis",
        questionAnswer: false),
    Questions(
        questionText: "O número pi (π) é uma constante irracional",
        questionAnswer: true),
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
                    onPressed: () => processAnswer(false),
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
