import 'package:flutter/material.dart';
import 'package:quiz/models/result_card.dart';

class ResultScreen extends StatefulWidget {
  final int score;
  final int totalQuestions;

  const ResultScreen({
    Key? key,
    required this.score,
    required this.totalQuestions,
  }) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  Color determineColor() {
    double numericScore = double.parse(
        widget.score.toString()); // Convert score to a numerical type
    if (numericScore >= (60 * widget.totalQuestions) / 100) {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: ResultCard(
          score: widget.score,
          cor: determineColor(),
        ),
      ),
    );
  }
}
