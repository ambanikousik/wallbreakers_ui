import 'package:flutter/material.dart';
import 'package:wallbreakersui/ui_page_b.dart';
import 'package:wallbreakersui/ui_page_c.dart';
import 'package:wallbreakersui/ui_page_d.dart';
import 'package:wallbreakersui/ui_page_e.dart';
//import 'ui_page_a.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WallBreakers Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: UiPageE(),
    );
  }
}


