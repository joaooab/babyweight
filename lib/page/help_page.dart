import 'package:babyweight/widget/main_app_bar.dart';
import 'package:babyweight/widget/main_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  static const String ROUTE_NAME = '/help';
  static const String TITLE = 'Ajuda';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: mainDrawer(context),
      appBar: mainAppBar(HelpPage.TITLE),
      body: Center(),
    );
  }
}

// class _HelpPageState extends State<HelpPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(HelpPage.TITLE),
//         // backgroundColor: Color(0xFFF1A62E),
//         flexibleSpace: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               colors: <Color>[
//                 Constants.colorLightPrimary,
//                 Constants.colorDarkPrimary
//               ],
//             ),
//           ),
//         ),
//       ),
//       body: Center(),
//     );
//   }
// }
