import 'package:babyweight/model/percentile.dart';

class WeightReference {
  final int gestationalAge;
  final List<Percentile> percentiles;

  WeightReference(this.gestationalAge, this.percentiles);

  static WeightReference? fromTable(final String gestationalAge) {
    for (var reference in tableWeightReference) {
      final List<String> fields = reference.split(";");
      if (gestationalAge == fields[0]) {
        final int gestationalAge = int.tryParse(fields[0]) ?? 0;
        final List<Percentile> percentiles = [
          Percentile(int.tryParse(fields[1]) ?? 0, 3),
          Percentile(int.tryParse(fields[2]) ?? 0, 10),
          Percentile(int.tryParse(fields[3]) ?? 0, 50),
          Percentile(int.tryParse(fields[4]) ?? 0, 90),
          Percentile(int.tryParse(fields[5]) ?? 0, 97),
        ];
        return WeightReference(gestationalAge, percentiles);
      }
    }
    return null;
  }
}

//gestationalAge;percentile3;percentile10;percentile50;percentile90;percentile97
List<String> tableWeightReference = [
  "10;26;29;35;41;44",
  "11;34;37;45;53;56",
  "12;43;48;58;68;73",
  "13;55;61;73;85;91",
  "14;70;77;93;109;116",
  "15;88;97;117;137;146",
  "16;110;121;146;171;183",
  "17;136;150;181;212;226",
  "18;167;185;223;261;279",
  "19;205;227;273;319;341",
  "20;248;275;331;387;414",
  "21;299;331;399;467;499",
  "22;359;398;478;559;598",
  "23;426;471;568;665;710",
  "24;503;556;670;784;838",
  "25;589;652;785;918;981",
  "26;685;758;913;1068;1141",
  "27;791;879;1055;1234;1319",
  "28;908;1004;1210;1416;1513",
  "29;1034;1145;1379;1613;1754",
  "30;1169;1294;1559;1824;1949",
  "31;1313;1453;1751;2049;2189",
  "32;1465;1621;1953;2285;2441",
  "33;1622;1794;2162;2530;2703",
  "34;1783;1973;2377;2781;2971",
  "35;1946;2154;2595;3036;3244",
  "36;2110;2335;2813;3291;3516",
  "37;2271;2513;3028;3543;3785",
  "38;2427;2686;3236;3786;4045",
  "39;2576;2851;3435;4019;4294",
  "40;2714;3004;3619;4234;4524",
];
