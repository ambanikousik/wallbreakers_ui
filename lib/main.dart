import 'package:flutter/material.dart';
import 'package:wallbreakersui/pages/ui_page_a.dart';
import 'package:wallbreakersui/ui_Shift_Planing.dart';
import 'package:wallbreakersui/ui_Shift_Planing_3.dart';
import 'package:wallbreakersui/ui_building_details.dart';
import 'package:wallbreakersui/ui_complex_manage.dart';
import 'package:wallbreakersui/ui_login.dart';
import 'package:wallbreakersui/ui_page_b.dart';
import 'package:wallbreakersui/ui_page_c.dart';
import 'package:wallbreakersui/ui_page_d.dart';
import 'package:wallbreakersui/ui_page_e.dart';
import 'package:wallbreakersui/ui_resident_details.dart';
import 'package:wallbreakersui/ui_shift_planing_2.dart';
import 'package:wallbreakersui/ui_signup.dart';
import 'package:wallbreakersui/ui_unit_details.dart';
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
      home: ResidentDetails(),
    );
  }
}


