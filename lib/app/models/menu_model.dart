import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tangani/app/routes/app_pages.dart';

class MenuModel {
  IconData menuIcon;
  String menuTitle;
  String menuUrl;

  MenuModel({
    required this.menuIcon,
    required this.menuTitle,
    required this.menuUrl,
  });
}

List<MenuModel> menuData = [
  MenuModel(
    menuIcon: CupertinoIcons.book,
    menuTitle: "TangaWarta",
    menuUrl: Routes.TANGAWARTA,
  ),
  MenuModel(
    menuIcon: CupertinoIcons.book,
    menuTitle: "TangaResponse",
    menuUrl: Routes.TANGAWARTA,
  ),
  MenuModel(
    menuIcon: CupertinoIcons.book,
    menuTitle: "TangaPangan",
    menuUrl: Routes.TANGAWARTA,
  ),
  MenuModel(
    menuIcon: CupertinoIcons.book,
    menuTitle: "TangaPeta",
    menuUrl: Routes.TANGAWARTA,
  ),
  MenuModel(
    menuIcon: CupertinoIcons.book,
    menuTitle: "TangaSiaga",
    menuUrl: Routes.TANGAWARTA,
  ),
  MenuModel(
    menuIcon: CupertinoIcons.book,
    menuTitle: "TangaAmbulance",
    menuUrl: Routes.TANGAWARTA,
  ),
  MenuModel(
    menuIcon: CupertinoIcons.book,
    menuTitle: "TangaSmart",
    menuUrl: Routes.TANGAWARTA,
  ),
  MenuModel(
    menuIcon: CupertinoIcons.book,
    menuTitle: "TangaWarta",
    menuUrl: Routes.TANGAWARTA,
  ),
  MenuModel(
    menuIcon: CupertinoIcons.book,
    menuTitle: "TangaWarta",
    menuUrl: Routes.TANGAWARTA,
  ),
];
