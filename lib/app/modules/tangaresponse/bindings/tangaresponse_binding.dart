import 'package:get/get.dart';

import '../controllers/tangaresponse_controller.dart';

class TangaresponseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TangaresponseController>(
      () => TangaresponseController(),
    );
  }
}
