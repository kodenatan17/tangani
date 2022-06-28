// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:tangani/app/modules/admin/pages/dashboard/dashboard.dart';

import '../pages/accounts/accounts.dart';
import '../pages/authentication/authentcation.dart';
import '../pages/laporan/laporan.dart';
import 'routes.dart';

Route<dynamic>? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case DashboardPageRoutes:
      return _getPageRoute(DashboardPage());
    case LaporanPageRoutes:
      return _getPageRoute(LaporanPage());
    case AccountsPageRoutes:
      return _getPageRoute(AccountsPage());
    default:
      return _getPageRoute(AuthenticationPage());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
