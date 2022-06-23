import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tangani/app/modules/admin/constants/styles.dart';
import 'package:tangani/app/modules/admin/routing/routes.dart';

class AdminController extends GetxController {
  static AdminController instance = Get.find();
  var activeItem = DashboardPageRoutes.obs;
  var hoverItem = "".obs;

  changeActiveItemTo(String itemName) {
    activeItem.value = itemName;
  }

  onHover(String itemName) {
    if (isActive(itemName)) hoverItem.value = itemName;
  }

  isActive(String itemName) => activeItem.value == itemName;

  isHovering(String itemName) => hoverItem.value == itemName;

  Widget returnIconFor(String itemName) {
    switch (itemName) {
      case DashboardPageRoutes:
        return _customIcon(Icons.trending_up, itemName);
      case LaporanPageRoutes:
        return _customIcon(Icons.camera_alt_outlined, itemName);
      case AccountsPageRoutes:
        return _customIcon(Icons.manage_accounts, itemName);
      case AuthenticationPageRoutes:
        return _customIcon(Icons.exit_to_app, itemName);
      default:
        return _customIcon(Icons.exit_to_app, itemName);
    }
  }

  Widget _customIcon(IconData icon, String itemName) {
    if (isActive(itemName))
      return Icon(
        icon,
        size: 22,
        color: darker,
      );

    return Icon(
      icon,
      color: isHovering(itemName) ? darker : lightGrey,
    );
  }
}
