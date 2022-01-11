import 'package:babyweight/model/weight_reference.dart';
import 'package:babyweight/page/table/table_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LandscapeTable extends TableWidget {
  @override
  Widget build() {
    return ListView(children: [
      DataTable(
        headingRowColor: headingRowColor,
        columnSpacing: 40,
        decoration: defaultBoxDecoration(),
        columns: createHeaders(),
        rows: _buildRows(),
      ),
    ]);
  }

  List<DataRow> _buildRows() {
    List<DataRow> rows = [];
    WeightReference.references.forEach((weightReference) {
      DataRow row = DataRow(cells: _buildCells(weightReference));
      rows.add(row);
    });
    return rows;
  }

  List<DataCell> _buildCells(WeightReference reference) {
    List<DataCell> cells = [];
    cells.add(DataCell(Text(reference.gestationalAge.toString())));
    reference.percentiles.forEach((percentil) {
      cells.add(DataCell(Text(percentil.weight.toString())));
    });

    return cells;
  }
}
