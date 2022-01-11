import 'package:babyweight/model/help.dart';
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
      body: HelpList(),
    );
  }
}

class HelpList extends StatefulWidget {
  @override
  _HelpListState createState() => _HelpListState();
}

class _HelpListState extends State<HelpList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        children: _buildHelpList());
  }

  List<Card> _buildHelpList() {
    List<_HelpListItem> list = [
      new _HelpListItem(
          help: Help("Idade gestacional?",
              "É o tempo de gravidez contado em semanas")),
      new _HelpListItem(
          help: Help("Peso fetal?", "Peso do bebê informado no último exame")),
      new _HelpListItem(
        help: Help("Como é feito o cálculo?",
            "Dado as duas entradas idade gestacional e peso fetal, encontramos o percentil aproximado do seu bebê, segundo a tabela de referência para valores de peso fetal estimado. Exemplo: 15 semanas (idade gestacional) e 130 gramas (peso fetal). Está entre os percentis 10 e 50, mais próximo do 50 (que é 137) então, aproximadamente o percentil é 40."),
      )
    ];

    return list.map((e) => _buildHelpCardList(e)).toList(growable: false);
  }

  Card _buildHelpCardList(_HelpListItem item) => Card(
      elevation: 4.0,
      child: Padding(padding: const EdgeInsets.all(8.0), child: item),
      margin: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0));
}

class _HelpListItem extends ListTile {
  _HelpListItem({required Help help})
      : super(
          title: Text(help.title),
          subtitle: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(help.description)),
        );
}
