import 'package:flutter/material.dart';

import 'info_card.dart';

class DashboardCardsMediumScreen extends StatelessWidget {
  const DashboardCardsMediumScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            InfoCard(
              title: "Laporan in Progress",
              value: "7",
              onTap: () {},
              topColor: Colors.orange,
              isActive: false,
            ),
            SizedBox(
              width: _width / 64,
            ),
            InfoCard(
              title: "Laporan Success",
              value: "17",
              onTap: () {},
              topColor: Colors.lightGreen,
              isActive: false,
            ),
          ],
        ),
        SizedBox(
          height: 16,
        ),
        Row(
          children: [
            InfoCard(
              title: "Laporan Cancelled",
              value: "0",
              onTap: () {},
              topColor: Colors.redAccent,
              isActive: false,
            ),
            SizedBox(
              width: _width / 64,
            ),
            InfoCard(
              title: "Laporan Scheduled",
              value: "10",
              onTap: () {},
              topColor: Colors.grey,
              isActive: false,
            ),
          ],
        ),
      ],
    );
  }
}
