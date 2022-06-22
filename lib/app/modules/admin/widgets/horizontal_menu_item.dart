import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tangani/app/modules/admin/constants/styles.dart';
import 'package:tangani/app/modules/admin/widgets/custom_text.dart';

import '../constants/controllers.dart';

class HorizontalMenuItem extends StatelessWidget {
  final String itemName;
  final VoidCallback onTap;

  const HorizontalMenuItem(
      {Key? key, required this.itemName, required this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      onHover: (value) {
        value
            ? adminController.onHover(itemName)
            : adminController.onHover("not Hovering");
      },
      child: Obx(
        () => Container(
          color: adminController.isHovering(itemName)
              ? lightGrey.withOpacity(.1)
              : Colors.transparent,
          child: Row(
            children: [
              Visibility(
                visible: adminController.isHovering(itemName) ||
                    adminController.isActive(itemName),
                child: Container(
                  width: 6,
                  height: 40,
                  color: darker,
                ),
                maintainSize: true,
                maintainState: true,
                maintainAnimation: true,
              ),
              SizedBox(
                width: _width / 80,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: adminController.returnIconFor(itemName),
              ),
              if (!adminController.isActive(itemName))
                Flexible(
                  child: CustomText(
                    text: itemName,
                    weight: adminController.isHovering(itemName)
                        ? FontWeight.bold
                        : FontWeight.normal,
                    size: 18,
                    color: adminController.isHovering(itemName)
                        ? darker
                        : lightGrey,
                  ),
                )
              else
                Flexible(
                  child: CustomText(
                    text: itemName,
                    color: darker,
                    size: 18,
                    weight: FontWeight.bold,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
