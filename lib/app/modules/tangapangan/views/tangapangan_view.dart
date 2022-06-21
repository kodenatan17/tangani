import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tangapangan_controller.dart';

class TangapanganView extends GetView<TangapanganController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TangapanganView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'TangapanganView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
