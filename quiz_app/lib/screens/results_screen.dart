import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/question_summary.dart';

import '../data/questions.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {required this.selectedAnswers, required this.restartQuiz, super.key});
  final List<String> selectedAnswers;
  final void Function() restartQuiz;

  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summary = [];

    for (var i = 0; i < selectedAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'selected_answer': selectedAnswers[i],
        'correct_answer': questions[i].answers[0],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final totalNumQuestions = questions.length;
    final correctNumQuestions = summaryData
        .where((data) => data['selected_answer'] == data['correct_answer'])
        .length;
    return SizedBox(
      height: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You answered $correctNumQuestions out of $totalNumQuestions correctly!",
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 24),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            QuestionSummary(summaryData),
            const SizedBox(height: 30),
            OutlinedButton.icon(
                style: ButtonStyle(
                  side: const MaterialStatePropertyAll(
                      BorderSide(color: Colors.transparent, width: 2)),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                ),
                icon: const Icon(Icons.restart_alt),
                onPressed: restartQuiz,
                label: const Text("Restart Quiz")),
          ],
        ),
      ),
    );
  }
}
