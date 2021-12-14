import 'package:flutter/material.dart';

class Percentile {
  static final String NAME_PERCENTIL = "Percentil ";
  static final String NAME_MIN_PERCENTIL = "Percentil menor que 3";
  static final String NAME_MAX_PERCENTIL = "Percentil maior que 97";
  static final String DESCRIPTION_NORMAL =
      "Peso adequado para idade gestacional";
  static final String DESCRIPTION_LOWER = "Limite inferior da normalidade";
  static final String DESCRIPTION_HIGHER = "Limite superior da normalidade";

  final int weight;
  final int value;

  Percentile(this.weight, this.value);

  String getName() {
    if (value < 3) {
      return NAME_MIN_PERCENTIL;
    } else if (value > 97) {
      return NAME_MAX_PERCENTIL;
    }

    return NAME_PERCENTIL + value.toString();
  }

  String getDescription() {
    if (value < 10) {
      return DESCRIPTION_LOWER;
    } else if (value > 90) {
      return DESCRIPTION_HIGHER;
    }

    return DESCRIPTION_NORMAL;
  }

  Color getColor() {
    if (value < 10) {
      return Colors.red;
    } else if (value > 90) {
      return Colors.red;
    }

    return Colors.black;
  }

}
