import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
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
              width: 200,
              height: 150,
              fit: BoxFit.cover,
            ),
            Container(
              padding: EdgeInsets.only(
                top: kDefaultPadding,
                right: kDefaultPadding * 3.5,
                left: kDefaultPadding * 3.5,
              ),
              child: Form(
                child: Column(
                  children: [
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
                    Row(children: <Widget>[
                      Expanded(
                        child: new Container(
                            margin:
                                const EdgeInsets.only(left: 10.0, right: 20.0),
                            child: Divider(
                              color: Colors.black,
                              height: 36,
                            )),
                      ),
                      Text("OR"),
                      Expanded(
                        child: new Container(
                            margin:
                                const EdgeInsets.only(left: 20.0, right: 10.0),
                            child: Divider(
                              color: Colors.black,
                              height: 36,
                            )),
                      ),
                    ]),
                    TextFormField(
                      controller: controller.emailController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email),
                        fillColor: Colors.transparent,
                        filled: true,
                        hintText: "Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(KDefaultCircular),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: kDefaultPadding * 2,
                    ),
                    TextFormField(
                      controller: controller.passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        fillColor: Colors.transparent,
                        filled: true,
                        hintText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(KDefaultCircular),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: kDefaultPadding,
                    ),
                    Row(
                      children: [
                        Text(
                          'Dengan menggunakan aplikasi Tangani, saya menyetujui segala',
                          style: AppStyleText.TANGA_SUBTITLE_CARD,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            alignment: Alignment.topLeft,
                          ),
                          onPressed: () {},
                          child: Text(
                            'Syarat dan Ketentuan',
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 12,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Sign in',
                          style: AppStyleText.LOGIN_TITLE,
                        ),
                        CircleAvatar(
                          radius: kDefaultPadding * 3,
                          backgroundColor: Color(0xFF4C505B),
                          child: IconButton(
                            color: Colors.white,
                            onPressed: () {},
                            icon: Icon(Icons.arrow_forward_ios),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: kDefaultPadding * 9,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () => Get.toNamed(Routes.REGISTER),
                          child: Text(
                            'Daftar',
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 18,
                              color: Color(0xFF4C505B),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () => Get.toNamed(Routes.FORGOT_PASSWORD),
                          child: Text(
                            'Lupa Password',
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 18,
                              color: Color(0xFF4C505B),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
