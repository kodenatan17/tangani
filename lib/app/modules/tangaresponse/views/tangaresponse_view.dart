import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tangaresponse_controller.dart';

class TangaresponseView extends GetView<TangaresponseController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TangaresponseView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'TangaresponseView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
