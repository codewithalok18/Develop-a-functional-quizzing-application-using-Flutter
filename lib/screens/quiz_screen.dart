import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestion = 0;
  int score = 0;

  List<Map<String, Object>> questions = [
    {
      'question': 'What is Flutter?',
      'options': ['SDK', 'IDE', 'Language', 'Compiler'],
      'answer': 'SDK',
    },
    {
      'question': 'Which language is used in Flutter?',
      'options': ['Java', 'Dart', 'Kotlin', 'Swift'],
      'answer': 'Dart',
    },
  ];

  void checkAnswer(String option) {
    if (option == questions[currentQuestion]['answer']) {
      score++;
    }

    setState(() {
      if (currentQuestion < questions.length - 1) {
        currentQuestion++;
      } else {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text("Quiz Completed"),
            content: Text("Your score is $score/${questions.length}"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: Text("OK"),
              )
            ],
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var q = questions[currentQuestion];
    return Scaffold(
      appBar: AppBar(title: Text('Quiz')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(q['question'].toString(), style: TextStyle(fontSize: 22)),
            ...(q['options'] as List<String>).map((opt) {
              return ElevatedButton(
                onPressed: () => checkAnswer(opt),
                child: Text(opt),
              );
            }).toList()
          ],
        ),
      ),
    );
  }
}
