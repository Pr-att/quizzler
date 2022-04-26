import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'quizbrain.dart';

Quizbrain quizBrain = Quizbrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  Quizzler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

List<Widget> scorekeeper = [];
// List<String> question = [
//   'You can lead a cow down stairs but not up stairs.',
//   'Approximately one quarter of human bones are in the feet.',
//   'A slug\'s blood is green.',
// ];
// List<bool> answers = [false, true, true];

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: GoogleFonts.lobster(fontSize: 35, color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
              child: Text(
                'True',
                style: GoogleFonts.lobster(fontSize: 20, color: Colors.white),
              ),
              onPressed: () {
                bool correctAnswer = quizBrain.getQuestionAnswer();
                setState(() {
                  if (correctAnswer == true) {
                    scorekeeper.add(const Icon(
                      Icons.check,
                      color: Colors.green,
                    ));
                  } else {
                    scorekeeper.add(
                      const Icon(Icons.close, color: Colors.red),
                    );
                  }
                });
                quizBrain.nextQuestion();
                //The user picked true.
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red)),
              child: Text(
                'False',
                style: GoogleFonts.lobster(fontSize: 20, color: Colors.white),
              ),
              onPressed: () {
                bool correctAnswer = quizBrain.getQuestionAnswer();
                setState(() {
                  if (correctAnswer == false) {
                    scorekeeper.add(const Icon(
                      Icons.check,
                      color: Colors.green,
                    ));
                  } else {
                    scorekeeper.add(
                      const Icon(Icons.close, color: Colors.red),
                    );
                  }
                });
                quizBrain.nextQuestion();
              },
            ),
          ),
        ),
        Row(children: scorekeeper)
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
