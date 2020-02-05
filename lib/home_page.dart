import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; //for JsonDecode

class HomePage extends StatefulWidget {
  List currencies;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<MaterialColor> colors = [Colors.blue, Colors.indigo, Colors.red];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Crypto Tracker V2'),
        ),
        body: _cryptoWidget(),
      ),
    );
  }

  Future<List> getCurrencies() async {
    String url = 'https://api.coinmarketcap.com/v1/ticker/';
    http.Response response = await http.get(url);
    return jsonDecode(response.body);
  }

  Widget _cryptoWidget() {
    return Container(
      child: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              itemCount: widget.currencies.length,
              itemBuilder: (BuildContext context, int index) {
                final Map currency = widget.currencies[index];
                final MaterialColor color = colors[index % colors.length];
                return _getListItemUI(currency, color);
              },
            ),
          )
        ],
      ),
    );
  }

  ListTile _getListItemUI(Map currency, MaterialColor color) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color,
        child: Text(currency['name'][0]),
      ),
      title:
          Text(currency['name'], style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: _getSubtitleText(
          currency['price_usd'], currency['percent_change_1h']),
      isThreeLine: true,
    );
  }

  Widget _getSubtitleText(String priceUSD, String percentChange) {
    TextSpan priceTextWidget =
        TextSpan(text: '\$$priceUSD\n', style: TextStyle(color: Colors.black));
    String percentageChangeText = '1 hour : $percentChange%';
    TextSpan percentageChangeTextWidget;

    if (double.parse(percentChange) > 0) {
      percentageChangeTextWidget = TextSpan(
          text: percentageChangeText, style: TextStyle(color: Colors.green));
    } else {
      percentageChangeTextWidget = TextSpan(
          text: percentageChangeText, style: TextStyle(color: Colors.red));
    }
    return RichText(
      text: TextSpan(children: [priceTextWidget, percentageChangeTextWidget]),
    );
  }
}
