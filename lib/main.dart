import 'package:babyweight/page/help/help_page.dart';
import 'package:babyweight/page/home/home_page.dart';
import 'package:babyweight/page/table/table_page.dart';
import 'package:babyweight/route/route.dart';
import 'package:babyweight/util/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(App());
}

class App extends StatelessWidget {
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

class ApplciationState extends ChangeNotifier {
  ApplciationState() {
    init();
  }

  Future<void> init() async {
    await Firebase.initializeApp();
  }
}
