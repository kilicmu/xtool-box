import 'dart:io';

import 'package:flutter/material.dart';
import 'package:xtool_box/router/index.dart';
import 'package:xtool_box/theme/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final _currentTheme = "normal";
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final curTheme = themes[_currentTheme];
    return MaterialApp(
      title: 'xtool-box',
      debugShowCheckedModeBanner: false,
      routes: routes,
      theme: curTheme?.theme!,
      initialRoute: "/",
    );
  }
}
