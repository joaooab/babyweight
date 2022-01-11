import 'package:babyweight/model/percentile.dart';
import 'package:babyweight/model/weight_reference.dart';
import 'package:babyweight/util/calculator_weight.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  test('Calculate percentile is correct', () {
    var percetiles = [Percentile(29, 10), Percentile(35, 50)];
    var reference = WeightReference(10, percetiles);

    var percentile = CalculatorWeight.calculate(34, reference);

    expect(percentile.value, 43);
  });
}
