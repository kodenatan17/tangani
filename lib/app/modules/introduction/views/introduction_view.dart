import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';

import '../../../routes/app_pages.dart';
import '../controllers/introduction_controller.dart';

class IntroductionView extends GetView<IntroductionController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: [
          PageViewModel(
            title: "Berinteraksi dengan mudah",
            body:
                "Kita hanya perlu dirumah saja untuk berinteraksi dengan masyarakat",
            image: Container(
              width: Get.width * 0.6,
              height: Get.width * 0.6,
              child: Center(
                child: Lottie.asset("assets/lottie/main-laptop-duduk.json"),
              ),
            ),
          ),
          PageViewModel(
            title: "Kemudahan untuk menyampaikan informasi",
            body:
                "Kita tidak perlu repot untuk melaporkan beberapa laporan dengan masyarakat",
            image: Container(
              width: Get.width * 0.6,
              height: Get.width * 0.6,
              child: Center(
                child: Lottie.asset("assets/lottie/report-masyarakat.json"),
              ),
            ),
          ),
          PageViewModel(
            title: "Mengkonfigurasi data masyarakat lebih mudah",
            body:
                "Memvalidasi data-data serta laporan masyarakat jauh lebih mudah",
            image: Container(
              width: Get.width * 0.6,
              height: Get.width * 0.6,
              child: Center(
                child: Lottie.asset("assets/lottie/menyusun-laporan.json"),
              ),
            ),
          ),
          PageViewModel(
            title: "Memberikan informasi dengan akurat",
            body: "Memberikan informasi tentang laporan dengan akurat",
            image: Container(
              width: Get.width * 0.6,
              height: Get.width * 0.6,
              child: Center(
                child: Lottie.asset("assets/lottie/report-lokasi.json"),
              ),
            ),
          ),
        ],
        onDone: () => Get.offAllNamed(Routes.LOGIN),
        showBackButton: false,
        showSkipButton: true,
        skip: const Icon(Icons.skip_next),
        next: const Icon(Icons.next_plan),
        done: const Text(
          "Login",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
