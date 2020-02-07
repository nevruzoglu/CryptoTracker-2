import 'dart:io';
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'models.dart';

void main() async {
  var currencies = await getCurrencies();
  runApp(MyApp(currencies));
}

class MyApp extends StatelessWidget {
  final Btc currencies;
  MyApp(this.currencies);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.pink),
      home: HomePage(currencies),
    );
  }
}

Future<Btc> getCurrencies() async {
  String url =
      'https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest';
  http.Response response = await http.get(url,
      headers: {"X-CMC_PRO_API_KEY": "api-key enter"}); // enter api key
  return Btc.fromMap(jsonDecode(response.body));
}
