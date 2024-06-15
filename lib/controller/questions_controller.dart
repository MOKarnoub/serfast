import 'package:get/get.dart';
import 'package:serfast0_1/data/datasrc/static/static.dart';

class QuestionsController extends GetxController {
  var listQuestions = listQuestion;
  void changeShowSubTitle(int index) {
    if (listQuestions[index].showSubTitle) {
      listQuestions[index].showSubTitle = false;
      update();
    } else {
      listQuestions[index].showSubTitle = true;
      update();
    }
  }
}
