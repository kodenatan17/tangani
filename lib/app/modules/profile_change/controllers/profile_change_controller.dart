import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/auth_controller.dart';

class ProfileChangeController extends GetxController {
  final authC = Get.find<AuthController>();

  late TextEditingController displayNameC;
  late TextEditingController usernameC;
  late TextEditingController emailC;
  late TextEditingController phoneC;
  late TextEditingController passwordC;
  late TextEditingController ktpC;

  @override
  void onInit() {
    super.onInit();
    displayNameC = TextEditingController();
    usernameC = TextEditingController(text: "${authC.usersModel.value.username}");
    emailC = TextEditingController(text: "${authC.usersModel.value.email}");
    phoneC = TextEditingController(text: "${authC.usersModel.value.phone}");
    passwordC = TextEditingController(text: "${authC.usersModel.value.password}");
    ktpC = TextEditingController(text: "${authC.usersModel.value.ktp}");

  }

  @override
  void onClose() {
    usernameC.dispose();
    emailC.dispose();
    phoneC.dispose();
    passwordC.dispose();
    ktpC.dispose();
    super.onClose();
  }

}
