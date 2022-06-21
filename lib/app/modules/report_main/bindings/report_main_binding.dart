import 'package:get/get.dart';

import '../controllers/report_main_controller.dart';

class ReportMainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReportMainController>(
      () => ReportMainController(),
    );
  }
}
