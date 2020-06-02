import 'dart:convert';
import 'dart:math';

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

  String result;

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
            RaisedButton(
              child: Text('Do it'),
              onPressed: () {
                int x = random.nextInt(20);
                int y = random.nextInt(20);
                setState(() {
                  result = '$x + $y = ${_argon2ffi.addIt(x, y)} --- ';
                });
              },
            ),
            RaisedButton(
              child: Text('hash stuff'),
              onPressed: () {
                final args = Argon2Arguments(
                  utf8.encode('abc'),
                  utf8.encode('abc'),
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
