import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() async {
  List currencies = await getCurrencies();
  runApp(MyApp(currencies));
}

class MyApp extends StatelessWidget {
  final List currencies;
  MyApp(this.currencies);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.pink),
      home: HomePage(currencies),
    );
  }
}

Future<List> getCurrencies() async {
  String url = 'https://api.coinmarketcap.com/v1/ticker/';
  http.Response response = await http.get(url);
  return jsonDecode(response.body);
}
