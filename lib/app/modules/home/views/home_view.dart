import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tangani/app/modules/activity/views/activity_view.dart';
import 'package:tangani/app/modules/dashboard/views/dashboard_view.dart';
import 'package:tangani/app/modules/notification/views/notification_view.dart';
import 'package:tangani/app/modules/profile/views/profile_view.dart';
import 'package:tangani/app/modules/report/views/report_view.dart';
import 'package:tangani/app/widgets/constants.dart';

import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
          child: IndexedStack(
            index: controller.tabIndex,
            children: [
              DashboardView(),
              ActivityView(),
              ReportView(),
              NotificationView(),
              ProfileView(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: kDarkColor,
          selectedItemColor: kDefaultColor,
          onTap: controller.changeTabIndex,
          currentIndex: controller.tabIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: [
            _bottomNavigationBarItem(icon: CupertinoIcons.home, label: 'Home'),
            _bottomNavigationBarItem(
                icon: CupertinoIcons.rectangle_on_rectangle,
                label: 'Notification'),
            _bottomNavigationBarItem(
                icon: CupertinoIcons.camera_circle, label: 'Laporan'),
            _bottomNavigationBarItem(
                icon: CupertinoIcons.bell, label: 'Activity'),
            _bottomNavigationBarItem(
                icon: CupertinoIcons.profile_circled, label: 'Profile'),
          ],
        ),
      );
    });
  }

  _bottomNavigationBarItem({required IconData icon, required String label}) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}
