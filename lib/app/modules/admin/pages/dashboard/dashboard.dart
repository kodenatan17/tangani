import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:tangani/app/modules/admin/constants/controllers.dart';
import 'package:tangani/app/modules/admin/constants/styles.dart';
import 'package:tangani/app/modules/admin/helpers/responsiveness.dart';
import 'package:tangani/app/modules/admin/pages/dashboard/widgets/dashboard_cards_large.dart';
import 'package:tangani/app/modules/admin/pages/dashboard/widgets/dashboard_cards_small.dart';
import 'package:tangani/app/modules/admin/pages/dashboard/widgets/dashboards_cards_medium.dart';
import 'package:tangani/app/modules/admin/pages/dashboard/widgets/laporan_section_small.dart';
import 'package:tangani/app/modules/admin/pages/dashboard/widgets/laporan_table.dart';
import 'package:tangani/app/modules/admin/widgets/custom_text.dart';

import 'widgets/laporan_section_large.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Obx(
            () => Row(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: ResponsiveWidget.isSmallScreen(context) ? 56 : 6,
                  ),
                  child: CustomText(
                    text: adminController.activeItem.value,
                    size: 24,
                    weight: FontWeight.bold,
                    color: darker,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                //CARD NAVIGATION
                if (ResponsiveWidget.isLargeScreen(context) ||
                    ResponsiveWidget.isMediumScreen(context))
                  if (ResponsiveWidget.isCustomScreen(context))
                    DashboardCardsMediumScreen()
                  else
                    DashboardCardsLargeScreen()
                else
                  DashboardsCardsSmallScreen(),
                //BAR CHART
                if (!ResponsiveWidget.isSmallScreen(context))
                  LaporanSectionLarge()
                else
                  LaporanSectionSmall(),
                  //LAPORAN TABLE
                LaporanTable()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
