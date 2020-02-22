import 'dart:async';
import 'dart:ffi';
import 'dart:io';

import 'package:ffi/ffi.dart';
import 'package:flutter/services.dart';

typedef HashStuff = Pointer<Utf8> Function(Pointer<Utf8> str);

class Argon2Ffi {
  static const MethodChannel _channel = const MethodChannel('argon2_ffi');

  int Function(int x, int y) _nativeAdd;
  HashStuff _hashStuff;

  Argon2Ffi() {
    final argon2lib = Platform.isAndroid
        ? DynamicLibrary.open('libargon2_ffi.so')
        : DynamicLibrary.executable();
    _nativeAdd = argon2lib
        .lookup<NativeFunction<Int32 Function(Int32, Int32)>>('native_add')
        .asFunction();
    _hashStuff =
        argon2lib.lookup<NativeFunction<HashStuff>>('hashStuff').asFunction();
  }

  int addIt(int x, int y) => _nativeAdd(x, y);
}
