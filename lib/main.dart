import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tangani/app/controllers/auth_controller.dart';
import 'package:tangani/app/utils/splash_screen.dart';
import 'package:tangani/firebase_options.dart';
import 'app/routes/app_pages.dart';
import 'app/widgets/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final authC = Get.put(AuthController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Tangani App",
      initialRoute: Routes.REPORT_MAIN,
      getPages: AppPages.routes,
    );

    // return FutureBuilder(
    //   future: Future.delayed(kDefaultDuration),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.done) {
    //       return Obx(
    //         () => GetMaterialApp(
    //           title: "Tangani App",
    //           initialRoute:
    //               authC.isAuth.isTrue ? AppPages.INITIAL : Routes.LOGIN,
    //           // initialRoute: AppPages.INITIAL,
    //           getPages: AppPages.routes,
    //         ),
    //       );
    //     }
    //     return FutureBuilder(
    //       future: authC.firstInitialized(),
    //       builder: (context, snapshot) => SplashScreen(),
    //     );
    //   },
    // );
  }
}
