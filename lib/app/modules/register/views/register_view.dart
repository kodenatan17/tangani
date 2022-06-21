import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tangani/app/routes/app_pages.dart';
import 'package:tangani/app/widgets/app_style_text.dart';
import 'package:tangani/app/widgets/constants.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/images/register.png",
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                "assets/images/logo-transparent.png",
                width: MediaQuery.of(context).size.width * 0.6,
              ),
            ),
            Positioned(
              top: 160,
              left: 50,
              right: 50,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: kDefaultPadding,
                  horizontal: kDefaultPadding,
                ),
                child: ElevatedButton.icon(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                    side: MaterialStateProperty.all(
                      BorderSide(
                        color: Colors.black54,
                        width: 0.5,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                  onPressed: () {},
                  icon: Image.asset(
                    "assets/icons/ico_google.png",
                    fit: BoxFit.cover,
                    width: 30,
                    height: 30,
                  ),
                  label: Text("Masuk dengan Akun Google"),
                ),
              ),
            ),
            Positioned(
              top: 220,
              right: 50,
              left: 50,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: new Container(
                      margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                      child: Divider(
                        color: Colors.black,
                        height: 36,
                      ),
                    ),
                  ),
                  Text(
                    "Atau",
                    style: AppStyleText.CARDSUBTITLE_TEXT,
                  ),
                  Expanded(
                    child: new Container(
                        margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                        child: Divider(
                          color: Colors.black,
                          height: 36,
                        )),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width * 0.65,
                  right: kDefaultPadding * 3.5,
                  left: kDefaultPadding * 3.5,
                ),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email),
                        fillColor: Colors.transparent,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(KDefaultCircular),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: kDefaultPadding * 2,
                    ),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        fillColor: Colors.transparent,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(KDefaultCircular),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: kDefaultPadding * 2,
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
                      height: kDefaultPadding * 4,
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
