import 'package:flutter/material.dart';
import 'package:teste_01/tela_destino.dart';

void main() => runApp(QuizApp());

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int questionIndex = 0;
  int score = 0;

  List<Question> questions = [
    Question('Flutter é uma linguagem de programação?', false),
    Question('O Dart é uma linguagem de Programação Orientada a Objetos', true),
    Question('O Flutter é para Android?', true),
  ];

  void checkAnswer(bool userAnswer) {
    bool correctAnswer = questions[questionIndex].answer;

    setState(() {
      if (userAnswer == correctAnswer) {
        score++;
      }
      if (questionIndex < questions.length - 1) {
        questionIndex++;
      }
    });
  }

  void resetQuiz() {
    setState(() {
      questionIndex = 0;
      score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: Image.network(
              'https://i.pinimg.com/236x/a8/85/48/a88548056fe6058cf6be96c07cc89034.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            flex: 7,
            child: Center(
              child: Text(
                questions[questionIndex].questionText,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24.0),
              ),
            ),
          ),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: [
              ElevatedButton(
                onPressed: () => checkAnswer(true),
                child: Text('Verdadeiro'),
              ),
              ElevatedButton(
                onPressed: () => checkAnswer(false),
                child: Text('Falso'),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              'Pontuação: $score / ${questions.length}',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TelaResultado(score, questionIndex)),
              );
            },
            child: Text('Tela de Resultado'),
          ),
        ],
      ),
    );
  }
}

class Question {
  final String questionText;
  final bool answer;

  Question(this.questionText, this.answer);
}
