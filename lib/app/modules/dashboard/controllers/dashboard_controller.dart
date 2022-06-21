import 'package:get/get.dart';

class DashboardController extends GetxController {
  //TODO: Implement DashboardController

  var tabIndex = 0;

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }
}
