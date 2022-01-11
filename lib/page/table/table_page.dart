import 'package:babyweight/page/table/table_landscape_builder.dart';
import 'package:babyweight/page/table/table_portrait_builder.dart';
import 'package:babyweight/widget/main_app_bar.dart';
import 'package:babyweight/widget/main_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TablePage extends StatefulWidget {
  static const String ROUTE_NAME = '/table';
  static const String TITLE = 'Tabela Referência';

  _TablePage createState() => _TablePage();
}

class _TablePage extends State<TablePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: mainDrawer(context),
      appBar: mainAppBar(TablePage.TITLE),
      body: createTable(),
    );
  }

  OrientationBuilder createTable() {
    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        if (orientation == Orientation.portrait) {
          return PortraitTableBuilder().build();
        } else {
          return LandscapeTableBuilder().build();
        }
      },
    );
  }
}
