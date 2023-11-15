import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  QuestionSummary(this.summarydata, {super.key});
  final List<Map<String, Object>> summarydata;
  Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summarydata.map((data) {
            if (data['selected_answer'] == data['correct_answer']) {
              backgroundColor = Colors.lightBlue;
            } else {
              backgroundColor = Colors.pink[100];
            }
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  maxRadius: 15,
                  backgroundColor: backgroundColor,
                  child: Text(
                    ((data['question_index'] as int) + 1).toString(),
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['question'] as String,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 16),
                      ),
                      Text(data['selected_answer'] as String,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 236, 163, 15),
                              fontSize: 12)),
                      Text(data['correct_answer'] as String,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 213, 247, 21),
                              fontSize: 14)),
                      const SizedBox(height: 10)
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
