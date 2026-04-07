import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {

  int questionIndex = 0;
  int score = 0;

  final List<Map<String, dynamic>> questions = [

    {
      "question": "Should you share your password?",
      "answers": [
        {"text": "Yes", "correct": false},
        {"text": "No", "correct": true},
      ]
    },

    {
      "question": "Is it safe to click unknown links?",
      "answers": [
        {"text": "Yes", "correct": false},
        {"text": "No", "correct": true},
      ]
    },

    {
      "question": "Should you talk to strangers online?",
      "answers": [
        {"text": "Yes", "correct": false},
        {"text": "No", "correct": true},
      ]
    },

    {
      "question": "Is public Wi-Fi always safe?",
      "answers": [
        {"text": "Yes", "correct": false},
        {"text": "No", "correct": true},
      ]
    },

  ];

  void answerQuestion(bool correct) {
    if (correct) score++;

    setState(() {
      questionIndex++;
    });
  }

  void restartQuiz() {
    setState(() {
      questionIndex = 0;
      score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {

    /// If quiz finished → show result screen
    if (questionIndex >= questions.length) {
      return Scaffold(
        appBar: AppBar(title: const Text("Quiz Result")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              const Text(
                "🏆 Quiz Completed!",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 20),

              Text(
                "Score: $score / ${questions.length}",
                style: const TextStyle(fontSize: 20),
              ),

              const SizedBox(height: 30),

              ElevatedButton(
                onPressed: restartQuiz,
                child: const Text("Restart Quiz"),
              )
            ],
          ),
        ),
      );
    }

    var currentQuestion = questions[questionIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cyber Safety Quiz"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            /// Progress Bar
            LinearProgressIndicator(
              value: (questionIndex + 1) / questions.length,
            ),

            const SizedBox(height: 20),

            /// Question Count
            Text(
              "Question ${questionIndex + 1} of ${questions.length}",
              style: const TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),

            /// Question
            Text(
              currentQuestion["question"],
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            /// Answers
            ...(currentQuestion["answers"] as List).map((answer) {
              return Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 10),

                child: ElevatedButton(
                  onPressed: () => answerQuestion(answer["correct"]),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(15),
                  ),
                  child: Text(answer["text"]),
                ),
              );
            }).toList(),

          ],
        ),
      ),
    );
  }
}