import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  final GlobalKey<FormState>loginFormKey=GlobalKey<FormState>();
  late TextEditingController emailController,passwordController;
  var email='';
  var password='';

  void onInit(){
    super.onInit();
    emailController=TextEditingController();
    passwordController=TextEditingController();
  }

  void onClose(){
    emailController.dispose();
    passwordController.dispose();
  }

  String? validateEmail(String value){
    if(!GetUtils.isEmail(value)){
      return "Provide valid Email";
    }
    return null;
  }

}
