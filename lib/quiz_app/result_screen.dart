import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_1/quiz_app/data/questions.dart';
import 'package:test_1/quiz_app/result_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
    this.selectedAnswer, {
    super.key,
    required this.onRestart,
  });

  final List<String> selectedAnswer;
  final void Function() onRestart;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    selectedAnswer.asMap().forEach((index, answer) {
      summary.add({
        "question_index": index,
        "question": questions[index].text,
        "correct_answer": questions[index].answers[0],
        "answer": answer
      });
    });

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestion = questions.length;
    final numCorrectQuestio = summaryData
        .where((data) => data['answer'] == data['correct_answer'])
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You answered $numCorrectQuestio out of $numTotalQuestion questions correctly!',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  color: Colors.pinkAccent,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 40),
              ResultSummary(summaryData),
              const SizedBox(height: 40),
              TextButton.icon(
                onPressed: onRestart,
                icon: const Icon(
                  Icons.refresh,
                  color: Colors.white,
                ),
                label: Text(
                  "Restart Quiz",
                  style: GoogleFonts.roboto(color: Colors.white),
                ),
              ),
            ],
          )),
    );
  }
}
