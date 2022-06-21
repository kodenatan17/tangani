import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tangasiaga_controller.dart';

class TangasiagaView extends GetView<TangasiagaController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TangasiagaView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'TangasiagaView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
