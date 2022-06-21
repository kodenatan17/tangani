import 'package:get/get.dart';

import '../controllers/profile_change_controller.dart';

class ProfileChangeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileChangeController>(
      () => ProfileChangeController(),
    );
  }
}
