import 'dart:async';

import 'package:flutter/services.dart';

class Argon2Ffi {
  static const MethodChannel _channel =
      const MethodChannel('argon2_ffi');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
