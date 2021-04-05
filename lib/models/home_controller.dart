import 'dart:math';

import 'package:intl/intl.dart';

class HomeController {

  double _btcPrice;
  double _portfolioValueBtc;
  double _portfolioValueEur;

  final NumberFormat euroFormatter = NumberFormat.currency(
    locale: 'en_US',
    symbol: '€',
    decimalDigits: 2,
  );

  final NumberFormat btcFormatter = NumberFormat.currency(
    locale: 'en_US',
    symbol: 'BTC',
    decimalDigits: 3,
  );

  HomeController() {
    var rand = Random.secure();

    _btcPrice = rand.nextDouble() * 200000;
    _portfolioValueBtc = rand.nextDouble();
    _portfolioValueEur = rand.nextDouble() * 10000;
  }

  String portfolioValueBtc() {
    return btcFormatter.format(_portfolioValueBtc);
  }

  String portfolioValueEur() {
    return euroFormatter.format(_portfolioValueEur);
  }

  String btcPrice() {
    return euroFormatter.format(_btcPrice);
  }

}