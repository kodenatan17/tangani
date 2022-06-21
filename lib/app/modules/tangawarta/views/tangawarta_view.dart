import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tangawarta_controller.dart';

class TangawartaView extends GetView<TangawartaController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TangawartaView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'TangawartaView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
