import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/activity_controller.dart';

class ActivityView extends GetView<ActivityController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'ActivityView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
