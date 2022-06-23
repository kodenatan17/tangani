import 'package:flutter/widgets.dart';
import 'package:tangani/app/modules/admin/constants/controllers.dart';
import 'package:tangani/app/modules/admin/routing/router.dart';

import '../routing/routes.dart';

Navigator localNavigator() => Navigator(
      key: navigationController.navigationKey,
    initialRoute: DashboardPageRoutes,
    onGenerateRoute: generateRoute,
    );
