import 'package:get/get.dart';

import '../controllers/tangapeta_controller.dart';

class TangapetaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TangapetaController>(
      () => TangapetaController(),
    );
  }
}
