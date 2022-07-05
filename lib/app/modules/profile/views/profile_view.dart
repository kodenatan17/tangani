import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tangani/app/routes/app_pages.dart';
import 'package:tangani/app/widgets/app_style_text.dart';
import 'package:tangani/app/widgets/constants.dart';
import 'package:tangani/app/widgets/presence_labelt.dart';
import 'package:tangani/app/widgets/spacer_style.dart';
import 'package:tangani/app/widgets/template_card.dart';

import '../../../controllers/auth_controller.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBgPrimaryColor,
        title: Text(
          "Profile",
          style: AppStyleText.TANGA_APPBAR_PAGE,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding,
                vertical: kDefaultPadding,
              ),
              height: 140,
              child: new Stack(
                children: <Widget>[
                  Container(
                    height: 124,
                    margin: new EdgeInsets.only(left: kDefaultPadding * 5),
                    padding: new EdgeInsets.only(left: kDefaultPadding * 6),
                    decoration: new BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: new BorderRadius.circular(KDefaultCircular),
                      border: Border.all(
                        width: 1.0,
                        color: Colors.grey.shade300,
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.white,
                          new Color(0xFFFFA500),
                        ],
                      ),
                      boxShadow: <BoxShadow>[
                        new BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10.0,
                          offset: new Offset(0.0, 12.0),
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("${authC.usersModel.value.displayName!}",
                                style: AppStyleText.CARDTEMPTITLE_TEXT),
                            Text("${authC.usersModel.value.ktp!}",
                                style: AppStyleText.CARDTEMPSUBTITLE_TEXT),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin:
                        new EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                    alignment: FractionalOffset.centerLeft,
                    child: Stack(
                      children: [
                        new AvatarGlow(
                          glowColor: kDefaultColor,
                          endRadius: 55.0,
                          duration: Duration(milliseconds: 1000),
                          repeat: true,
                          showTwoGlows: true,
                          child: Material(
                            // Replace this child with your own
                            elevation: 2.0,
                            shape: CircleBorder(),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child:
                                  authC.usersModel.value.photoURL == "noimage"
                                      ? Image.asset(
                                          'assets/avatar/noimage.png',
                                          height: 90,
                                        )
                                      : Image.network(
                                          authC.usersModel.value.photoURL!,
                                          height: 90,
                                          fit: BoxFit.cover,
                                        ),
                            ),
                          ),
                        ),
                        // new Positioned(
                        //   bottom: 0,
                        //   right: -25,
                        //   child: RawMaterialButton(
                        //     onPressed: () {},
                        //     elevation: 2.0,
                        //     fillColor: kDefaultColor,
                        //     child: InkWell(
                        //       onTap: () {
                        //         showBottomSheet;
                        //       },
                        //       child: Icon(
                        //         Icons.camera_alt_outlined,
                        //         color: Colors.white,
                        //       ),
                        //     ),
                        //     padding: const EdgeInsets.all(kDefaultPadding / 2),
                        //     shape: CircleBorder(),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  Container(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Image(
                        image: AssetImage("assets/images/logo-transparent.png"),
                        width: 125,
                        height: 125,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding,
                vertical: kDefaultPadding,
              ),
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 15,
                    width: 10,
                    margin: const EdgeInsets.only(
                        left: kDefaultPadding * 5, top: kDefaultPadding),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(KDefaultCircular),
                        bottomLeft: Radius.circular(KDefaultCircular),
                      ),
                      color: Colors.blueAccent,
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 15,
                    width: MediaQuery.of(context).size.width / 1.1,
                    margin: const EdgeInsets.only(
                      left: kDefaultPadding * 5,
                      top: kDefaultPadding,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(kDefaultPadding),
                        bottomRight: Radius.circular(kDefaultPadding),
                      ),
                      color: kDarkColor,
                    ),
                    padding: const EdgeInsets.only(left: kDefaultPadding / 2),
                    child: PresenceLabelt(),
                  ),
                ],
              ),
            ),
            SpacerStyle(),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                physics: NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                    vertical: kDefaultPadding, horizontal: kDefaultPadding),
                children: <Widget>[
                  Text(
                    "Akun",
                    style: AppStyleText.CARDTITLE_TEXT,
                  ),
                  ListTile(
                    onTap: () => Get.toNamed(Routes.PROFILE_CHANGE),
                    title: Text("Ubah Profil"),
                    leading: Icon(Icons.person_outline_outlined),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  ListTile(
                    onTap: () {},
                    title: Text("Disimpan"),
                    leading: Icon(Icons.bookmark_outline_rounded),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  ListTile(
                    onTap: () {},
                    title: Text("Pengaturan"),
                    leading: Icon(Icons.settings_outlined),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  SpacerStyle(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: kDefaultPadding / 2,
                      horizontal: kDefaultPadding / 2,
                    ),
                    child: Text(
                      "Laporan Saya",
                      style: AppStyleText.CARDTITLE_TEXT,
                    ),
                  ),
                  ListTile(
                    onTap: () {},
                    title: Text("Status Laporan"),
                    leading: Icon(Icons.assessment_outlined),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  ListTile(
                    onTap: () {},
                    title: Text("Detail Laporan"),
                    leading: Icon(Icons.video_settings_outlined),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  SpacerStyle(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: kDefaultPadding / 2,
                      horizontal: kDefaultPadding / 2,
                    ),
                    child: Text(
                      "Tentang Tangani",
                      style: AppStyleText.CARDTITLE_TEXT,
                    ),
                  ),
                  ListTile(
                    onTap: () {},
                    title: Text("Tentang Aplikasi Tangani"),
                    leading: Icon(Icons.info_outline_rounded),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  ListTile(
                    onTap: () {},
                    title: Text("Syarat dan Ketentuan"),
                    leading: Icon(Icons.flag_circle_outlined),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  SpacerStyle(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: kDefaultPadding * 2),
                    child: ElevatedButton.icon(
                      onPressed: () => authC.logout(),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                      ),
                      icon: Icon(
                        // <-- Icon
                        Icons.qr_code_scanner_outlined,
                        size: 18.0,
                        color: Colors.white,
                      ),
                      label: Text(
                        'Logout',
                        style: TextStyle(color: Colors.white),
                      ), // <-- Text
                    ),
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
