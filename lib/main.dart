import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzler/QuizzBrain.dart';

QuizzBrain quizzBrain = QuizzBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  final QuizzBrain controller = QuizzBrain();

  @override
  Widget build(BuildContext context) {
    Get.put(controller);

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatelessWidget {
  final QuizzBrain controller = Get.find<QuizzBrain>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Obx(() {
                return Text(
                  controller.getText(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                  ),
                );
              })
            ),
          ),
        ),
        Builder(
          builder: (context) {
            return AnswerButton(
              value: true,
              background: Colors.green,
            );
          }
        ),
        AnswerButton(
          value: false,
          background: Colors.red,
        ),
        Obx(() {
          return Row(
            children: controller.checks.map(
                    (bool value) => Icon(
                  value ? Icons.check : Icons.clear,
                  color: value ? Colors.green : Colors.red,
                )
            ).toList(),
          );
        })
      ],
    );
  }
}

class AnswerButton extends StatelessWidget {
  final QuizzBrain controller = Get.find<QuizzBrain>();
  final bool value;
  final Color background;

  AnswerButton({required this.value, required this.background});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: background
                ),
              ),
              TextButton(
                child: Center(
                  child: Text(
                    value.toString().toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                onPressed: () => controller.checkAnswer(value),
              ),
            ]
        ),
      ),
    );
  }
}

