import 'package:babyweight/model/percentile.dart';
import 'package:babyweight/model/weight_reference.dart';

class CalculatorWeight {
  static Percentile calculate(
      final int weight, final WeightReference weightReference) {
    final List<Percentile> percentiles = weightReference.percentiles;
    Percentile firstPercentile = percentiles.first;
    Percentile lastPercentile = percentiles.last;

    if (weight < firstPercentile.weight) {
      return Percentile(weight, 1);
    } else if (weight > lastPercentile.weight) {
      return Percentile(weight, 100);
    }

    Percentile currentLowestPercentile = firstPercentile;

    for (int i = 1; i < percentiles.length; i++) {
      Percentile currentHighestPercentile = percentiles[i];
      if (weight <= currentHighestPercentile.weight) {
        return _calculatePercentile(
            weight, currentLowestPercentile, currentHighestPercentile);
      } else {
        currentLowestPercentile = currentHighestPercentile;
      }
    }

    return currentLowestPercentile;
  }

  static Percentile _calculatePercentile(final int weight,
      final Percentile lowestPercentile, final Percentile highestPercentile) {
    int wh = highestPercentile.value;
    int wl = lowestPercentile.value;
    int ph = highestPercentile.weight;
    int pl = lowestPercentile.weight;
    int p = weight;

    int value = ((wh - wl) / (ph - pl) * (p - pl) + wl).toInt();

    return Percentile(weight, value);
  }
}
