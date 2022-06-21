import 'package:get/get.dart';

import '../controllers/tangasiaga_controller.dart';

class TangasiagaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TangasiagaController>(
      () => TangasiagaController(),
    );
  }
}
