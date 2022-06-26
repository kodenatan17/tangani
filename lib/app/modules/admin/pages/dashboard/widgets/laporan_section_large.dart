import 'package:flutter/material.dart';
import 'package:tangani/app/modules/admin/constants/styles.dart';
import 'package:tangani/app/modules/admin/widgets/custom_text.dart';

import 'bar_chart.dart';
import 'laporan_info.dart';

class LaporanSectionLarge extends StatelessWidget {
  const LaporanSectionLarge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 6),
            color: lightGrey.withOpacity(.1),
            blurRadius: 12,
          ),
        ],
        border: Border.all(color: lightGrey, width: .5),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomText(
                  text: "Laporan Chart",
                  size: 20,
                  weight: FontWeight.bold,
                  color: lightGrey,
                ),
                Container(
                  width: 600,
                  height: 200,
                  child: SimpleBarChart.withSampleData(),
                ),
              ],
            ),
          ),
          Container(
            width: 1,
            height: 120,
            color: lightGrey,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    LaporanInfo(
                      title: "Laporan\'s Hari Ini",
                      amount: "23",
                    ),
                    LaporanInfo(
                      title: "7 Hari Terakhir",
                      amount: "150",
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    LaporanInfo(
                      title: "30 Hari Terakhir",
                      amount: "1,204",
                    ),
                    LaporanInfo(
                      title: "12 Bulan Terakhir",
                      amount: "3,432",
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
