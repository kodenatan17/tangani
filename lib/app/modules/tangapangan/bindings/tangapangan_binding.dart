import 'package:get/get.dart';

import '../controllers/tangapangan_controller.dart';

class TangapanganBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TangapanganController>(
      () => TangapanganController(),
    );
  }
}
