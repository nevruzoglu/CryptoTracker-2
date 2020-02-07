import 'package:flutter/material.dart';

import 'models.dart';

class HomePage extends StatefulWidget {
  final Btc currencies;
  HomePage(this.currencies);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<MaterialColor> colors = [Colors.blue, Colors.indigo, Colors.green];
  @override
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

  Widget _cryptoWidget() {
    return Container(
      color: Color(0xff282539),
      child: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              itemCount: widget.currencies.data.length,
              itemBuilder: (BuildContext context, int index) {
                var currency = widget.currencies.data[index];
                final MaterialColor color = colors[index % colors.length];
                return _getListItemUI(currency, color);
              },
            ),
          )
        ],
      ),
    );
  }

  ListTile _getListItemUI(Datum currency, MaterialColor color) {
    var usd = currency.quote.usd.price;

    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color,
        foregroundColor: Colors.white,
        child: Text(currency.name[0]),
      ),
      title: Text(currency.name,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
      subtitle: _getSubtitleText(usd, currency.quote.usd.percentChange1H),
      isThreeLine: true,
    );
  }

  Widget _getSubtitleText(double priceUSD, double percentChange) {
    TextSpan priceTextWidget = TextSpan(
        text: '\$${priceUSD.toStringAsFixed(4)}\n',
        style: TextStyle(
          color: Colors.white,
        ));
    String percentageChangeText = '1 hour : $percentChange%';
    TextSpan percentageChangeTextWidget;

    if (percentChange > 0) {
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
