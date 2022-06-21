import 'package:flutter/material.dart';
import 'package:tangani/app/widgets/app_style_text.dart';
import 'package:tangani/app/widgets/constants.dart';

class DashboardPresence extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text(
              "Pindai untuk masuk/keluar lokasi",
              style: AppStyleText.SCAN_TEXT,
            ),
          ),
          Container(
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(
                // <-- Icon
                Icons.qr_code_scanner_outlined,
                size: 18.0,
              ),
              label: Text('Pindai'), // <-- Text
            ),
          ),
        ],
      ),
    );
  }
}
