import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/auth_controller.dart';

class ProfileChangeController extends GetxController {
  final authC = Get.find<AuthController>();


  late TextEditingController displayNameC;
  late TextEditingController emailC;
  late TextEditingController phoneC;
  late TextEditingController ktpC;

  @override
  void onInit() {
    super.onInit();
    displayNameC = TextEditingController(text: "${authC.usersModel.value.displayName}");
    emailC = TextEditingController(text: "${authC.usersModel.value.email}");
    phoneC = TextEditingController(text: "${authC.usersModel.value.phone}");
    ktpC = TextEditingController(text: "${authC.usersModel.value.ktp}");

  }

  @override
  void onClose() {
    emailC.dispose();
    phoneC.dispose();
    ktpC.dispose();
    super.onClose();
  }

}
