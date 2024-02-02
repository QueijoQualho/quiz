import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class Questions {
  String questionText;
  bool questionAnswer;

  Questions({
    required this.questionText,
    required this.questionAnswer,
  });
}

class _QuizScreenState extends State<QuizScreen> {
  List<Icon> scoreIcons = [];
  List<Questions> questions = [
    Questions(
        questionText: "Qual foi o primeiro homem a pisar na Lua",
        questionAnswer: true),
    Questions(questionText: "oie", questionAnswer: false),
    Questions(questionText: "asdas", questionAnswer: false)
  ];

  int i = 0;

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
                  onPressed: () {
                    if (i == questions.length - 1) {
                      if (scoreIcons.length < questions.length) {
                        if (questions[i].questionAnswer) {
                          setState(() {
                            scoreIcons.add(
                                const Icon(Icons.done, color: Colors.green));
                          });
                        } else {
                          setState(() {
                            scoreIcons.add(
                                const Icon(Icons.close, color: Colors.red));
                          });
                        }
                      }
                      return;
                    }

                    if (questions[i].questionAnswer) {
                      setState(() {
                        scoreIcons
                            .add(const Icon(Icons.done, color: Colors.green));
                      });
                    } else {
                      setState(() {
                        scoreIcons
                            .add(const Icon(Icons.close, color: Colors.red));
                      });
                    }

                    i++;
                  },
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
                    onPressed: () {
                      if (i == questions.length - 1) {
                        if (scoreIcons.length < questions.length) {
                          if (questions[i].questionAnswer) {
                            setState(() {
                              scoreIcons.add(
                                  const Icon(Icons.done, color: Colors.green));
                            });
                          } else {
                            setState(() {
                              scoreIcons.add(
                                  const Icon(Icons.close, color: Colors.red));
                            });
                          }
                        }
                        return;
                      }

                      if (!questions[i].questionAnswer) {
                        setState(() {
                          scoreIcons
                              .add(const Icon(Icons.done, color: Colors.green));
                        });
                      } else {
                        setState(() {
                          scoreIcons
                              .add(const Icon(Icons.close, color: Colors.red));
                        });
                      }

                      i++;
                    },
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
            )
          ],
        ));
  }
}
