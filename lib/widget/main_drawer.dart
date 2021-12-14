import 'package:babyweight/page/help_page.dart';
import 'package:babyweight/page/home_page.dart';
import 'package:babyweight/route/route.dart';
import 'package:babyweight/util/constants.dart';
import 'package:flutter/material.dart';

Drawer mainDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                Constants.colorLightPrimary,
                Constants.colorDarkPrimary
              ],
            ),
          ),
          child: Text(
            Constants.appName,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: const Text(HomePage.title),
          onTap: () {
            Navigator.pushReplacementNamed(context, Routes.home);
          },
        ),
        ListTile(
          leading: Icon(Icons.help),
          title: const Text(HelpPage.TITLE),
          onTap: () {
            Navigator.pushReplacementNamed(context, Routes.help);
          },
        ),
      ],
    ),
  );
}
