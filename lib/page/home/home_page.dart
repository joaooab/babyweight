import 'package:babyweight/widget/main_app_bar.dart';
import 'package:babyweight/widget/main_drawer.dart';
import 'package:babyweight/model/percentile.dart';
import 'package:babyweight/model/weight_reference.dart';
import 'package:babyweight/util/constants.dart';
import 'package:flutter/material.dart';

import '../../util/calculator_weight.dart';

class HomePage extends StatefulWidget {
  static const String ROUTE_NAME = '/home';
  static const String TITLE = 'Home';

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  static const String BUTTON_AGE_NAME = "Idade gestacional(semanas)";
  static const String BUTTON_WEIGHT_NAME = "Peso fetal(g)";

  BannerAd? _addBanner;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final adState = Provider.of<AdState>(context);
    adState.initializaion.then((status) => {
          setState(() {
            _addBanner = BannerAd(
              adUnitId: adState.bannerAdUnitId,
              size: AdSize.banner,
              request: AdRequest(),
              listener: adState.adListener,
            )..load();
          }),
        });
  }

  final TextEditingController _controllerAge = TextEditingController();
  final TextEditingController _controllerWeight = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Percentile? _percentile;

  void _showPercentile(final Percentile percentile) {
    setState(() {
      _percentile = percentile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: mainDrawer(context),
      appBar: mainAppBar(HomePage.TITLE),
      body: Center(
        child: Container(
          decoration: BoxDecoration(color: Constants.colorLightBG),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 16.0),
                      child: buildOutlineTextField(
                          BUTTON_AGE_NAME, _controllerAge),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: buildOutlineTextField(
                          BUTTON_WEIGHT_NAME, _controllerWeight),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Visibility(
                    visible: _percentile != null,
                    child: Wrap(
                      children: <Widget>[
                        Card(
                          elevation: 4.0,
                          margin: const EdgeInsets.all(24.0),
                          child: Padding(
                            padding: const EdgeInsets.all(32.0),
                            child: Column(
                              children: <Widget>[
                                Text(_percentile?.getName() ?? "",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: _percentile?.getColor() ??
                                            Colors.black)),
                                Padding(
                                  padding: const EdgeInsets.only(top: 16.0),
                                  child: Text(
                                      _percentile?.getDescription() ?? "",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: _percentile?.getColor() ??
                                              Colors.black)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              _createAddContainer(),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Constants.colorLine, width: 1.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: buildRoundedButton("Calcular"),
                  // ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox buildRoundedButton(final String text) {
    return SizedBox(
      width: double.infinity,
      height: 48.0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Constants.colorDarkPrimary,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        ),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            calculate();
          }
        },
        child: Text(text),
      ),
    );
  }

  void calculate() {
    final int? age = int.tryParse(_controllerAge.text);
    final int? weight = int.tryParse(_controllerWeight.text);

    if (age != null && weight != null) {
      final WeightReference? weightReference =
          WeightReference.fromTable(age.toString());
      if (weightReference != null) {
        final Percentile percentile =
            CalculatorWeight.calculate(weight, weightReference);
        _showPercentile(percentile);
        hideKeyboard();
      }
    }
  }

  void hideKeyboard() {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  TextFormField buildOutlineTextField(
      final String label, final TextEditingController controller) {
    TextInputAction action = TextInputAction.next;
    if (label == BUTTON_WEIGHT_NAME) {
      action = TextInputAction.done;
    }

    return TextFormField(
      validator: (field) {
        final int? value = int.tryParse(field ?? "");
        if (value == null || value < 0) {
          return 'Valor inválido';
        }
        if (label == BUTTON_AGE_NAME && (value < 10 || value > 40))
          return '$BUTTON_AGE_NAME deve ser entre 10 e 40 semanas';
      },
      textInputAction: action,
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Constants.colorDarkAccent, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Constants.colorDarkAccent, width: 1.0),
        ),
      ),
      keyboardType: TextInputType.number,
    );
  }

  Widget _createAddContainer() {
    if (_addBanner == null) {
      return SizedBox(height: 50);
    } else {
      return Container(
        height: 50,
        child: AdWidget(ad: _addBanner!),
      );
    }
  }

}
