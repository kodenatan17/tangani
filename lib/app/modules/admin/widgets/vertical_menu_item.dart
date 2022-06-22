import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/controllers.dart';
import '../constants/styles.dart';
import 'custom_text.dart';

class VerticalMenuItem extends StatelessWidget {
  final String itemName;
  final VoidCallback onTap;

  const VerticalMenuItem(
      {Key? key, required this.itemName, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  width: 3,
                  height: 72,
                  color: darker,
                ),
                maintainSize: true,
                maintainState: true,
                maintainAnimation: true,
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
