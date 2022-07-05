import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:tangani/app/routes/app_pages.dart';
import 'package:tangani/app/widgets/app_style_text.dart';
import 'package:tangani/app/widgets/constants.dart';

import '../../../controllers/auth_controller.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/login-bg.png",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Image.asset(
              "assets/images/logo-transparent.png",
              width: 300,
              height: 150,
              fit: BoxFit.cover,
            ),
            Container(
              padding: EdgeInsets.only(
                top: kDefaultPadding,
                right: kDefaultPadding * 3.5,
                left: kDefaultPadding * 3.5,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Positioned(
                    left: 0,
                    bottom: 0,
                    child: Lottie.asset(
                      "assets/lottie/login.json",
                      height: MediaQuery.of(context).size.height * 0.65,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                        ),
                        icon: Image.asset(
                          "assets/icons/ico_google.png",
                          fit: BoxFit.cover,
                          height: 25,
                        ),
                        label: Text(
                          "Masuk dengan Google",
                          style: TextStyle(color: Colors.black45),
                        ),
                        onPressed: () => authC.loginGoogle(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
