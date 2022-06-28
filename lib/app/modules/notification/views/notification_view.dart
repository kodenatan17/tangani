import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tangani/app/widgets/app_style_text.dart';
import 'package:tangani/app/widgets/constants.dart';

import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBgPrimaryColor,
        title: Text(
          'Notification',
          style: AppStyleText.TANGA_TITLE_PAGE,
        ),
      ),
    );
  }
}
