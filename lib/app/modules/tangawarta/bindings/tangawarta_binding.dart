import 'package:get/get.dart';

import '../controllers/tangawarta_controller.dart';

class TangawartaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TangawartaController>(
      () => TangawartaController(),
    );
  }
}
