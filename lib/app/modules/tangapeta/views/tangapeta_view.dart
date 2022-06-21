import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tangapeta_controller.dart';

class TangapetaView extends GetView<TangapetaController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TangapetaView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'TangapetaView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
