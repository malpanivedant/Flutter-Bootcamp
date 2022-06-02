import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  if (Platform.isIOS) runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme:
          CupertinoThemeData(primaryColor: Color.fromARGB(15, 233, 211, 111)),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Cupertino Styled App'),
        ),
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: CupertinoButton(
            child: Text(
              'A Cupertino button',
            ),
            onPressed: () {},
          ),
        ));
  }
}
