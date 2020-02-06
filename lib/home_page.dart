import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final List currencies;
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
    var usd = double.parse(currency['price_usd']);

    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color,
        foregroundColor: Colors.white,
        child: Text(currency['name'][0]),
      ),
      title: Text(currency['name'],
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
      subtitle: _getSubtitleText(
          usd.toStringAsFixed(4), currency['percent_change_1h']),
      isThreeLine: true,
    );
  }

  Widget _getSubtitleText(String priceUSD, String percentChange) {
    TextSpan priceTextWidget = TextSpan(
        text: '\$$priceUSD\n',
        style: TextStyle(
          color: Colors.white,
        ));
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
