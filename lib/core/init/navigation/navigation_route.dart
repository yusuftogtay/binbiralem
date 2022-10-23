import 'package:flutter/material.dart';

import '../../../view/splash_view/SplashView.dart';
import '../../constants/navigation/NavigationConstant.dart';
import '../../../view/helper_views/NotFoundNavigationView.dart';

class NavigationRoute {
  static NavigationRoute? _instace;
  static NavigationRoute? get instance {
    _instace ??= NavigationRoute._init();
    return _instace;
  }

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstant.DEFAULT:
        return defaultNavigate(SplashView(), NavigationConstant.DEFAULT);
      default:
        return MaterialPageRoute(
          builder: (context) => NotFoundNavigationView(),
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
