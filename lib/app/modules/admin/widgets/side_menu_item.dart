import 'package:flutter/material.dart';
import 'package:tangani/app/modules/admin/helpers/responsiveness.dart';
import 'package:tangani/app/modules/admin/widgets/horizontal_menu_item.dart';
import 'package:tangani/app/modules/admin/widgets/vertical_menu_item.dart';

class SideMenuItem extends StatelessWidget {
  final String itemName;
  final VoidCallback onTap;

  const SideMenuItem({Key? key, required this.itemName, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (ResponsiveWidget.isCustomScreen(context))
      return VerticalMenuItem(
        itemName: itemName,
        onTap: onTap,
      );
    else if (ResponsiveWidget.isMediumScreen(context))
      return HorizontalMenuItem(
        itemName: itemName,
        onTap: onTap,
      );

    return HorizontalMenuItem(
      itemName: itemName,
      onTap: onTap,
    );
  }
}
