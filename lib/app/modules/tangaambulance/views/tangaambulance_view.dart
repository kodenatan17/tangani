import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tangaambulance_controller.dart';

class TangaambulanceView extends GetView<TangaambulanceController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TangaambulanceView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'TangaambulanceView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
