import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tangani/app/widgets/app_style_text.dart';
import 'package:tangani/app/widgets/constants.dart';

class DashboardMenu extends StatelessWidget {
  final String menuImage;
  final String menuTitle;

  DashboardMenu({
    required this.menuImage,
    required this.menuTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    width: 1.0,
                    color: Colors.grey.shade300,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(KDefaultCircular),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    menuImage,
                    color: kDefaultColor,
                  ),
                ),
              ),
              SizedBox(
                height: kDefaultPadding / 2,
              ),
              Text(menuTitle, style: AppStyleText.MENUTILE_TEXT),
            ],
          ),
        ],
      ),
    );
  }
}
