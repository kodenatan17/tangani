import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tangani/app/modules/admin/constants/styles.dart';
import 'package:tangani/app/modules/admin/widgets/custom_text.dart';

import '../../constants/controllers.dart';
import '../../helpers/responsiveness.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => Row(
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: ResponsiveWidget.isSmallScreen(context) ? 56 : 6,
                ),
                child: CustomText(
                  text: adminController.activeItem.value,
                  size: 24,
                  weight: FontWeight.bold,
                  color: darker,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
