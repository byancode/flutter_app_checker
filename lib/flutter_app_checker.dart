import 'dart:async';

import 'package:flutter/services.dart';

class FlutterAppChecker {
  static const MethodChannel _channel = MethodChannel('flutter_app_checker');

  static Future<bool> isAppInstalled({required String appName}) async {
    final args = <dynamic, dynamic>{};
    args["appName"] = appName;
    return await _channel.invokeMethod('isAppInstalled', args);
  }
}
