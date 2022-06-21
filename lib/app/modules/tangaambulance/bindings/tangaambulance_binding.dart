import 'package:get/get.dart';

import '../controllers/tangaambulance_controller.dart';

class TangaambulanceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TangaambulanceController>(
      () => TangaambulanceController(),
    );
  }
}
