import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tangani/app/modules/admin/helpers/responsiveness.dart';
import 'package:tangani/app/modules/admin/widgets/side_menu.dart';
import 'package:tangani/app/modules/admin/widgets/small_screen.dart';
import 'package:tangani/app/modules/admin/widgets/top_nav.dart';

import '../controllers/admin_controller.dart';
import '../widgets/large_screen.dart';
import '../widgets/medium_screen.dart';

class AdminView extends GetView<AdminController> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: topNavigationBar(context, scaffoldKey),
      drawer: Drawer(
        child: SideMenu(),
      ),
      body: ResponsiveWidget(
        largeScreen: LargeScreen(),
        smallScreen: SmallScreen(),
        mediumScreen: MediumScreen(),
      ),
    );
  }
}
