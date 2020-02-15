import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:argon2_ffi/argon2_ffi.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _argon2ffi = Argon2Ffi();
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
                  result =
                      '$x + $y = ${_argon2ffi.addIt(x, y)} --- ${_argon2ffi.hashStuff('LoremIpsum')}';
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
