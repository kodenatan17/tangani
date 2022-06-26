import 'package:flutter/material.dart';
import 'package:tangani/app/modules/admin/pages/dashboard/widgets/info_card.dart';

class DashboardCardsLargeScreen extends StatelessWidget {
  const DashboardCardsLargeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Row(
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
        SizedBox(
          width: _width / 64,
        ),
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
    );
  }
}
