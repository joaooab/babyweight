import 'package:babyweight/page/help/help_page.dart';
import 'package:babyweight/page/home/home_page.dart';
import 'package:babyweight/page/table/table_page.dart';
import 'package:babyweight/route/route.dart';
import 'package:babyweight/util/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appName,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: HomePage(),
      routes: {
        Routes.home: (context) => HomePage(),
        Routes.help: (context) => HelpPage(),
        Routes.table: (context) => TablePage(),
      },
    );
  }
}
