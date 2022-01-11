import 'package:babyweight/model/article.dart';
import 'package:babyweight/widget/main_app_bar.dart';
import 'package:babyweight/widget/main_drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  static const String ROUTE_NAME = '/help';
  static const String TITLE = 'Ajuda';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: mainDrawer(context),
      appBar: mainAppBar(HelpPage.TITLE),
      body: HelpList(),
    );
  }
}

class HelpList extends StatefulWidget {
  late final List<Article> articles;

  @override
  _HelpListState createState() => _HelpListState();
}

class _HelpListState extends State<HelpList> {
  final Stream<QuerySnapshot> _articlesStream = FirebaseFirestore.instance
      .collection('article')
      .orderBy("id")
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _articlesStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return _emptyState();
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return _loadingState();
          }

          return _dataState(snapshot);
        });
  }

  Container _loadingState() {
    return Container(child: Center(child: CircularProgressIndicator()));
  }

  Container _emptyState() {
    return Container(child: Center(child: Text("Falha aos buscar os dados")));
  }

  ListView _dataState(AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
    return ListView(
      children: snapshot.data!.docs.map((DocumentSnapshot document) {
        Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
        return Card(
          elevation: 4.0,
          margin: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(
                data['title'],
                style: TextStyle(fontSize: 18.0),
              ),
              subtitle: Padding(
                  padding: EdgeInsets.only(top: 10),
                  child:
                      Text(data['description'], textAlign: TextAlign.justify)),
            ),
          ),
        );
      }).toList(),
    );
  }
}
