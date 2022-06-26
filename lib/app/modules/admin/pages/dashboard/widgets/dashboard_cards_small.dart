import 'package:flutter/material.dart';
import 'package:tangani/app/modules/admin/pages/dashboard/widgets/info_card_small.dart';

class DashboardsCardsSmallScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Container(
      height: 400,
      child: Column(
        children: [
          InfoCardSmall(
            title: "Laporan in Progress",
            value: "7",
            onTap: () {},
            isActive: true,
          ),
          SizedBox(
            height: _width / 64,
          ),
          InfoCardSmall(
            title: "Laporan Success",
            value: "17",
            onTap: () {},
            isActive: false,
          ),
          SizedBox(
            height: _width / 64,
          ),
          InfoCardSmall(
            title: "Laporan Cancelled",
            value: "0",
            onTap: () {},
            isActive: false,
          ),
          SizedBox(
            height: _width / 64,
          ),
          InfoCardSmall(
            title: "Laporan Scheduled",
            value: "10",
            onTap: () {},
            isActive: false,
          ),
        ],
      ),
    );
  }
}
