import 'package:flutter/widgets.dart';

class NavigationService {
  static NavigationService? _instace;
  static NavigationService? get instance {
     _instace ??= NavigationService._init();
     return _instace;
  }

  NavigationService._init();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  final removeAllOldRoutes = (Route<dynamic> route) => false;

}