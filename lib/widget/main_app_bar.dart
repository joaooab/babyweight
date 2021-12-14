import 'package:babyweight/util/constants.dart';
import 'package:flutter/material.dart';

AppBar mainAppBar(String title) {
  return AppBar(
    title: Text(title),
    // backgroundColor: Color(0xFFF1A62E),
    flexibleSpace: Container(
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
    ),
  );
}
