import 'package:flutter/material.dart';
import 'package:quiz/view/quiz_screen.dart';

class ResultCard extends StatelessWidget {
  final int score;
  final Color cor;

  ResultCard({required this.score, required this.cor});

  @override
  Widget build(BuildContext context) {
    void reset() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const QuizScreen()));
    }

    Color backgroundColor;
     
    if (cor == Colors.red) {
      backgroundColor = Color.fromARGB(255, 231, 149, 149);
    } else {
      backgroundColor = Color.fromARGB(255, 149, 231, 174);
    }

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
                        color: cor, fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )),
        ElevatedButton(
          onPressed: () => reset(),
          child: const Text('Reiniciar Quiz'),
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
            onPrimary: Colors.white,
          ),
        )
      ],
    );
  }
}
