import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tangani/app/modules/report/components/report_init.dart';
import 'package:tangani/app/widgets/app_style_text.dart';
import 'package:tangani/app/widgets/constants.dart';
import 'package:permission_handler/permission_handler.dart';

import '../controllers/report_controller.dart';

class ReportView extends GetView<ReportController> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBgPrimaryColor,
        title: Text(
          'Buat Laporan',
          style: AppStyleText.TANGA_TITLE_PAGE,
        ),
      ),
      body: report_init(),
    );
  }
}

