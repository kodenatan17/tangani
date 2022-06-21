import 'dart:async';

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tangani/app/widgets/app_style_text.dart';
import 'package:tangani/app/widgets/constants.dart';

class PresenceLabelt extends StatefulWidget {
  const PresenceLabelt({Key? key}) : super(key: key);

  @override
  _PresenceLabeltState createState() => _PresenceLabeltState();
}

class _PresenceLabeltState extends State<PresenceLabelt> {
  String formattedDate = DateFormat('EEEE, dd MMMM yyyy').format(DateTime.now());
  String formattedTime = DateFormat('kk:mm:ss').format(DateTime.now());
  String hour = DateFormat('a').format(DateTime.now());
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer =
        Timer.periodic(const Duration(milliseconds: 500), (timer) => _update());
  }

  void _update() {
    setState(() {
      formattedTime = DateFormat('kk:mm:ss').format(DateTime.now());
      hour = DateFormat('a').format(DateTime.now());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text(
              formattedDate + ' / ' + formattedTime,
              style: AppStyleText.PRESENCELABEL_TEXT,
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
              label: Text('Absence'), // <-- Text
            ),
          ),
        ],
      ),
    );
  }
}
