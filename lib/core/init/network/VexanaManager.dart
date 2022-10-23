import 'dart:io';

import 'package:vexana/vexana.dart';

class VexanaManager {
  static VexanaManager? _instance;
  static VexanaManager? get instance {
    if (_instance != null) return _instance!;
    _instance = VexanaManager._init();
    return _instance;
  }

  VexanaManager._init();

  INetworkManager networkManager = NetworkManager(
      isEnableLogger: true,
      options: BaseOptions(baseUrl: Platform.isAndroid ? 'android' : 'ios'));
}
