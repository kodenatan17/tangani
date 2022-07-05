import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tangani/app/routes/app_pages.dart';
import 'package:tangani/app/widgets/app_style_text.dart';
import 'package:tangani/app/widgets/card_carousel.dart';
import 'package:tangani/app/widgets/card_page.dart';
import 'package:tangani/app/widgets/constants.dart';
import 'package:tangani/app/widgets/dashboard_menu.dart';
import 'package:tangani/app/widgets/spacer_style.dart';

import '../../../controllers/auth_controller.dart';
import '../../../models/card_model.dart';

import '../../../widgets/dashboard_presence.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  final authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kDefaultColor,
        centerTitle: false,
        elevation: 0,
        title: RichText(
          text: TextSpan(
            text: "Hai, ",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
            children: [
              TextSpan(
                  text: "${authC.usersModel.value.displayName}",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold))
            ],
          ),
        ),
        actions: <Widget>[
          IconButton(
            color: Colors.white,
            hoverColor: kDefaultColor,
            icon: const Icon(CupertinoIcons.headphones),
            tooltip: 'Customer Service',
            onPressed: () {
              // handle the press
            },
          ),
          IconButton(
            color: Colors.white,
            hoverColor: kDefaultColor,
            icon: const Icon(CupertinoIcons.qrcode_viewfinder),
            tooltip: 'QR Scanner',
            onPressed: () {
              // handle the press
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          ClipPath(
            clipper: ClipPathClass(),
            child: Container(
              height: 200,
              width: Get.width,
              color: kDefaultColor,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: kDefaultPadding * 2),
            child: Column(
              children: [
                Column(
                  children: [
                    ClipPath(
                      clipper: ClipPathInfo(),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding * 0.2,
                          vertical: kDefaultPadding,
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        height: 200,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              kDefaultColor,
                              Color(0Xffff6200),
                            ],
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: kDefaultPadding,
                                    horizontal: kDefaultPadding,
                                  ),
                                  height: 100,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${authC.usersModel.value.statusUser}",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start  ,
                                        children: [
                                          Text(
                                            "${authC.usersModel.value.phone}",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "${authC.usersModel.value.email}",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Image.asset(
                                      "assets/images/logo-transparent.png",
                                      fit: BoxFit.cover,
                                      width: 100,
                                      height: 50,
                                      color: Colors.white,
                                    ),
                                    Lottie.asset(
                                      "assets/lottie/dashboard.json",
                                      fit: BoxFit.cover,
                                      width: 170,
                                      height: 70,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: kDefaultPadding,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding * 1.5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          statusCard(
                            title: "Laporan",
                            data: "0",
                            subdata: " laporan",
                          ),
                          statusCard(
                            title: "Inbox",
                            data: "0",
                            subdata: " pesan",
                          ),
                          statusCard(
                            title: "Keluhan",
                            data: "0",
                            subdata: " keluhan",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: kDefaultPadding,
                    ),
                  ],
                ),
                Container(
                  height: 5,
                  color: Colors.grey.shade200,
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView(
                            padding: const EdgeInsets.symmetric(
                                horizontal: kDefaultPadding),
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Berita Terbaru di Tangani",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Lihat Semua",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: kDefaultColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    LaporanSection(
                                      laporanImage:
                                          "assets/images/tangaemergency-min.png",
                                      laporanStatus: "Menunggu Konfirmasi",
                                    ),
                                    LaporanSection(
                                      laporanImage:
                                          "assets/images/tangaemergency-min.png",
                                      laporanStatus: "Menunggu Konfirmasi",
                                    ),
                                    LaporanSection(
                                      laporanImage:
                                          "assets/images/tangaemergency-min.png",
                                      laporanStatus: "Menunggu Konfirmasi",
                                    ),
                                    LaporanSection(
                                      laporanImage:
                                          "assets/images/tangaemergency-min.png",
                                      laporanStatus: "Menunggu Konfirmasi",
                                    ),
                                    LaporanSection(
                                      laporanImage:
                                          "assets/images/tangaemergency-min.png",
                                      laporanStatus: "Menunggu Konfirmasi",
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Laporan RT/RW Terbaru",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Lihat Semua",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: kDefaultColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    LaporanSection(
                                      laporanImage:
                                          "assets/images/tangaemergency-min.png",
                                      laporanStatus: "Menunggu Konfirmasi",
                                    ),
                                    LaporanSection(
                                      laporanImage:
                                          "assets/images/tangaemergency-min.png",
                                      laporanStatus: "Menunggu Konfirmasi",
                                    ),
                                    LaporanSection(
                                      laporanImage:
                                          "assets/images/tangaemergency-min.png",
                                      laporanStatus: "Menunggu Konfirmasi",
                                    ),
                                    LaporanSection(
                                      laporanImage:
                                          "assets/images/tangaemergency-min.png",
                                      laporanStatus: "Menunggu Konfirmasi",
                                    ),
                                    LaporanSection(
                                      laporanImage:
                                          "assets/images/tangaemergency-min.png",
                                      laporanStatus: "Menunggu Konfirmasi",
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: kDefaultPadding,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class LaporanSection extends StatelessWidget {
  const LaporanSection({
    Key? key,
    required this.laporanImage,
    required this.laporanStatus,
  }) : super(key: key);

  final String laporanImage;
  final String laporanStatus;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Container(
        height: 150,
        width: Get.width * 0.7,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(laporanImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          alignment: Alignment.bottomCenter,
          color: Colors.black.withOpacity(0.3),
          width: Get.width * 0.7,
          child: Chip(
            padding: EdgeInsets.all(2),
            backgroundColor: Colors.redAccent,
            label: Text(
              laporanStatus,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class statusCard extends StatelessWidget {
  const statusCard({
    Key? key,
    required this.title,
    required this.data,
    required this.subdata,
  }) : super(key: key);

  final String title;
  final String data;
  final String subdata;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(kDefaultPadding / 2),
        width: Get.width * 0.25,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold),
            ),
            RichText(
              text: TextSpan(
                text: data,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: kDefaultColor,
                ),
                children: [
                  TextSpan(
                    text: subdata,
                    style: TextStyle(
                      fontSize: 16,
                      color: kDarkColor,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ClipPathClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 60);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 60,
    );
    path.lineTo(size.width, 0);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class ClipPathInfo extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width - 70, size.height);
    path.lineTo(size.width, size.height - 70);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
