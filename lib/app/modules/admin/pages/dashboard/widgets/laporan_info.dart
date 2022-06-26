import 'package:flutter/material.dart';
import 'package:tangani/app/modules/admin/constants/styles.dart';

class LaporanInfo extends StatelessWidget {
  final String title;
  final String amount;

  const LaporanInfo({Key? key, required this.title, required this.amount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: "$title \n\n",
              style: TextStyle(
                color: lightGrey,
                fontSize: 16,
              ),
            ),
            TextSpan(
              text: "$amount",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
