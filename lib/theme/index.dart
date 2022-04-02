import 'package:flutter/material.dart';

class ThemeRecord {
  IconData icon;
  ThemeData? theme;
  ThemeRecord({this.icon = Icons.question_mark, this.theme});
}

final themes = {
  "normal": ThemeRecord(
      theme: ThemeData(
          // primarySwatch: Colors.lightBlue,
          primaryColor: Colors.lightBlue.shade50))
};
