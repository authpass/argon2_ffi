import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:argon2_ffi_base/argon2_ffi_base.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _argon2ffi = Argon2FfiFlutter();
  final random = Random();

  String? result;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: <Widget>[
            Text('Result: $result\n'),
            ElevatedButton(
              child: Text('hash stuff'),
              onPressed: () {
                final args = Argon2Arguments(
                  utf8.encode('abc') as Uint8List,
                  utf8.encode('abc') as Uint8List,
                  1024,
                  2,
                  32,
                  2,
                  0,
                  1,
                );
                final hash = _argon2ffi.argon2(args);
                setState(() {
                  result = 'argon2 hash: ${base64.encode(hash)}';
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
