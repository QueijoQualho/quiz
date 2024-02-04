import 'package:flutter/material.dart';
import 'package:quiz/view/quiz_screen.dart';

class ResultCard extends StatelessWidget {
  final int score;
  final Color color;

  const ResultCard({required this.score, required this.color, Key? key})
      : super(key: key);

  void resetQuiz(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const QuizScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = color == Colors.red
        ? const Color.fromARGB(255, 231, 149, 149)
        : const Color.fromARGB(255, 149, 231, 174);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 4,
          child: Center(
            child: Container(
              color: backgroundColor,
              height: MediaQuery.of(context).size.height * 0.10,
              width: double.infinity,
              child: Center(
                child: Text(
                  "Pontuação: $score",
                  style: TextStyle(
                    color: color,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () => resetQuiz(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
          child: const Text('Reiniciar Quiz'),
        ),
      ],
    );
  }
}
