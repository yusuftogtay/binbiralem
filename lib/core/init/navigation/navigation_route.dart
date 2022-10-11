import 'dart:js';

import 'package:binbiralem/core/constants/navigation/navigation_constants.dart';
import 'package:flutter/material.dart';

class NavigationRoute {
  static NavigationRoute? _instace;
  static NavigationRoute? get instance {
    _instace ??= NavigationRoute._init();
    return _instace;
  }

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.DEFAULT:
        return defaultNavigate(SplashWidget(), NavigationConstants.DEFAULT);
      default:
        return MaterialPageRoute(
          builder: (context) => NotFoundNavigationWidget(),
        );
    }
  }

  MaterialPageRoute defaultNavigate(Widget widget, String pageName) {
    return MaterialPageRoute(
      builder: (context) => widget,
      settings: RouteSettings(name: pageName),
    );
  }
}
