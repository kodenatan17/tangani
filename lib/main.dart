import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tangani/app/controllers/auth_controller.dart';
import 'package:tangani/app/modules/admin/constants/styles.dart';
import 'package:tangani/app/modules/admin/controllers/admin_controller.dart';
import 'package:tangani/app/modules/admin/controllers/navigation_controller.dart';
import 'package:tangani/app/utils/splash_screen.dart';
import 'package:tangani/firebase_options.dart';
import 'app/routes/app_pages.dart';
import 'app/widgets/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Get.put(AdminController()); // instance Admin Controller
  Get.put(NavigationController()); //instance Local Navigation Controller
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final authC = Get.put(AuthController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    // return GetMaterialApp(
    //   title: "Tangani App",
    //   initialRoute: Routes.PROFILE,
    //   getPages: AppPages.routes,
    //   theme: ThemeData(
    //     scaffoldBackgroundColor: light,
    //     textTheme: GoogleFonts.mulishTextTheme(Theme.of(context).textTheme),
    //     pageTransitionsTheme: PageTransitionsTheme(builders: {
    //       TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
    //     }),
    //   ),
    // );

    return FutureBuilder(
      future: Future.delayed(kDefaultDuration),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Obx(
            () => GetMaterialApp(
              title: "Tangani App",
              initialRoute:
                  authC.isAuth.isTrue && authC.usersModel.value.statusUser == "admin"
                      ? Routes.ADMIN
                      : authC.isAuth.isTrue && authC.usersModel.value.statusUser != null
                          ? AppPages.INITIAL
                          : Routes.LOGIN,
              // initialRoute: AppPages.INITIAL,
              getPages: AppPages.routes,
              theme: ThemeData(
                scaffoldBackgroundColor: light,
                textTheme:
                    GoogleFonts.mulishTextTheme(Theme.of(context).textTheme),
                pageTransitionsTheme: PageTransitionsTheme(builders: {
                  TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
                }),
              ),
            ),
          );
        }
        return FutureBuilder(
          future: authC.firstInitialized(),
          builder: (context, snapshot) => SplashScreen(),
        );
      },
    );
  }
}
