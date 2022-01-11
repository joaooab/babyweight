import 'package:babyweight/util/constants.dart';
import 'package:flutter/material.dart';

abstract class TableBuilder {

  List<DataColumn> createHeaders() {
    return List.from(createAgeHeader())..addAll(createPercentileHeaders());
  }

  List<DataColumn> createAgeHeader() {
    return [
      DataColumn(label: Text('Semanas')),
    ];
  }

  List<DataColumn> createPercentileHeaders() {
    return [
      DataColumn(label: Text('P 3')),
      DataColumn(label: Text('P 10')),
      DataColumn(label: Text('P 50')),
      DataColumn(label: Text('P 90')),
      DataColumn(label: Text('P 97')),
    ];
  }

  MaterialStateProperty<Color> headingRowColor =
      MaterialStateProperty.all(Constants.colorLightPrimary);

  BoxDecoration defaultBoxDecoration() {
    return BoxDecoration(
      border: Border(
        right: BorderSide(
          color: Colors.grey,
          width: 0.5,
        ),
      ),
    );
  }

  Widget build();
}
