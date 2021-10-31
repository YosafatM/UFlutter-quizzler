import 'package:get/get.dart';

import 'constants.dart';

class QuizzBrain extends GetxController {
  Rx<int> _index = 0.obs;
  final List<bool> checks = <bool>[].obs;

  String getText() {
    return questions[_index.value].question;
  }

  void checkAnswer(bool answer) {
    if (_index.value == questions.length - 1) return;

    checks.add(questions[_index.value].answer == answer);
    _index.value++;
    update();
  }
}
