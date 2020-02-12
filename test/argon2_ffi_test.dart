import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:argon2_ffi/argon2_ffi.dart';

void main() {
  const MethodChannel channel = MethodChannel('argon2_ffi');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await Argon2Ffi.platformVersion, '42');
  });
}
