import 'package:get/get.dart';
import 'package:getx_test/model.dart';

class Controller extends GetxController {
  final person = Person().obs; //observable(변화를 감지함)

  void updateInfo() {
    person.update((val) {
      val?.age++;
      val?.name = 'coding chef';
    });
    update();
  }
}
