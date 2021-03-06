import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tangani/app/data/models/users_model.dart';
import 'package:tangani/app/widgets/constants.dart';

import '../../../controllers/auth_controller.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/app_style_text.dart';
import '../../../widgets/spacer_style.dart';
import '../controllers/profile_change_controller.dart';

class ProfileChangeView extends GetView<ProfileChangeController> {
  final authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBgPrimaryColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () => Get.back(),
        ),
        title: Text(
          "Ubah Profil",
          style: AppStyleText.TANGA_APPBAR_PAGE,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding,
                  vertical: kDefaultPadding,
                ),
                height: 150,
                child: new Stack(
                  children: <Widget>[
                    Container(
                      margin: new EdgeInsets.symmetric(
                          vertical: kDefaultPadding / 2),
                      alignment: FractionalOffset.topCenter,
                      child: Stack(
                        children: [
                          new AvatarGlow(
                            glowColor: kDefaultColor,
                            endRadius: 150.0,
                            duration: Duration(milliseconds: 1000),
                            repeat: true,
                            showTwoGlows: true,
                            child: Material(
                              // Replace this child with your own
                              elevation: 2.0,
                              shape: CircleBorder(),
                              child: Obx(
                                () => ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: authC.usersModel.value.photoURL ==
                                          "noimage"
                                      ? Image.asset(
                                          'assets/avatar/noimage.png',
                                          height: 110,
                                        )
                                      : Image.network(
                                          authC.usersModel.value.photoURL!,
                                          height: 110,
                                          fit: BoxFit.cover,
                                        ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SpacerStyle(),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(
                  vertical: kDefaultPadding,
                  horizontal: kDefaultPadding,
                ),
                child: Obx(
                  () => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        enabled: true,
                        textInputAction: TextInputAction.next,
                        controller: controller.displayNameC,
                        decoration: InputDecoration(labelText: "Nama Lengkap"),
                      ),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        readOnly: true,
                        controller: controller.emailC,
                        decoration: InputDecoration(labelText: "Email"),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        enabled: true,
                        controller: controller.phoneC,
                        decoration: InputDecoration(labelText: "No. Telp"),
                      ),
                      TextFormField(
                        enabled: false,
                        controller: controller.ktpC,
                        decoration: InputDecoration(
                            labelText: "Nomor Induk Kependudukan (NIK)"),
                      ),
                      Container(
                        width: Get.width,
                        child: ElevatedButton.icon(
                          onPressed: () => authC.changeProfile(
                              controller.displayNameC.text,
                              controller.phoneC.text),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(kDefaultColor),
                          ),
                          icon: Icon(
                            // <-- Icon
                            Icons.lock_person,
                            size: 18.0,
                            color: Colors.white,
                          ),
                          label: Text(
                            'Submit',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomSheet(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.2,
      margin: const EdgeInsets.symmetric(
        vertical: kDefaultPadding,
        horizontal: kDefaultPadding,
      ),
      child: Column(
        children: [
          Text(
            "Pilih Foto Anda",
            style: AppStyleText.MODAL_TEXT,
          ),
          SizedBox(
            height: kDefaultPadding * 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.image,
                      size: 40,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Gallery",
                      style: AppStyleText.SUBMODAL_TEXT,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: kDefaultPadding * 8,
              ),
              InkWell(
                onTap: () {},
                child: Column(
                  children: [
                    Icon(
                      Icons.camera,
                      size: 40,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Camera",
                      style: AppStyleText.SUBMODAL_TEXT,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
