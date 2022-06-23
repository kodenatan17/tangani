import 'package:flutter/material.dart';
import 'package:tangani/app/modules/admin/helpers/local_navigator.dart';
import 'package:tangani/app/modules/admin/widgets/side_menu.dart';

class MediumScreen extends StatelessWidget {
  const MediumScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SideMenu(),
        ),
        Expanded(
          flex: 5,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: localNavigator(),
          ),
        ),
      ],
    );
  }
}
