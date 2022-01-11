import 'package:babyweight/model/weight_reference.dart';
import 'package:babyweight/page/table/table_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PortraitTableBuilder extends TableBuilder {
  @override
  Widget build() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Row(
          children: [
            _fixedColumnWidget(),
            _scrollableColumnWidget(),
          ],
        ),
      ),
    );
  }

  Widget _fixedColumnWidget() {
    return DataTable(
        columnSpacing: 10,
        headingRowColor: headingRowColor,
        decoration: defaultBoxDecoration(),
        columns: createAgeHeader(),
        rows: [
          ...WeightReference.references.map(
            (reference) => DataRow(
              cells: [
                DataCell(
                  Text(reference.gestationalAge.toString()),
                ),
              ],
            ),
          ),
        ]);
  }

  Widget _scrollableColumnWidget() {
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
            headingRowColor: headingRowColor,
            columnSpacing: 40,
            decoration: defaultBoxDecoration(),
            columns: createPercentileHeaders(),
            rows: [
              ...WeightReference.references.map(
                (reference) => DataRow(
                  cells: [
                    ...reference.percentiles.map(
                      (percentil) => DataCell(
                        Text(percentil.weight.toString()),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}
