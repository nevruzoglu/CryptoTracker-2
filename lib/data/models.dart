// To parse this JSON data, do
//
//     final btc = btcFromJson(jsonString);

import 'dart:convert';

Btc btcFromJson(String str) => Btc.fromMap(json.decode(str));

String btcToJson(Btc data) => json.encode(data.toMap());

class Btc {
  Status status;
  List<Datum> data;

  Btc({
    this.status,
    this.data,
  });

  factory Btc.fromMap(Map<String, dynamic> json) => Btc(
        status: json["status"] == null ? null : Status.fromMap(json["status"]),
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status == null ? null : status.toMap(),
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class Datum {
  int id;
  String name;
  String symbol;
  String slug;
  int numMarketPairs;
  DateTime dateAdded;
  List<Tag> tags;
  double maxSupply;
  double circulatingSupply;
  double totalSupply;
  Platform platform;
  int cmcRank;
  DateTime lastUpdated;
  Quote quote;

  Datum({
    this.id,
    this.name,
    this.symbol,
    this.slug,
    this.numMarketPairs,
    this.dateAdded,
    this.tags,
    this.maxSupply,
    this.circulatingSupply,
    this.totalSupply,
    this.platform,
    this.cmcRank,
    this.lastUpdated,
    this.quote,
  });

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        symbol: json["symbol"] == null ? null : json["symbol"],
        slug: json["slug"] == null ? null : json["slug"],
        numMarketPairs:
            json["num_market_pairs"] == null ? null : json["num_market_pairs"],
        dateAdded: json["date_added"] == null
            ? null
            : DateTime.parse(json["date_added"]),
        tags: json["tags"] == null
            ? null
            : List<Tag>.from(json["tags"].map((x) => tagValues.map[x])),
        maxSupply:
            json["max_supply"] == null ? null : json["max_supply"].toDouble(),
        circulatingSupply: json["circulating_supply"] == null
            ? null
            : json["circulating_supply"].toDouble(),
        totalSupply: json["total_supply"] == null
            ? null
            : json["total_supply"].toDouble(),
        platform: json["platform"] == null
            ? null
            : Platform.fromMap(json["platform"]),
        cmcRank: json["cmc_rank"] == null ? null : json["cmc_rank"],
        lastUpdated: json["last_updated"] == null
            ? null
            : DateTime.parse(json["last_updated"]),
        quote: json["quote"] == null ? null : Quote.fromMap(json["quote"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "symbol": symbol == null ? null : symbol,
        "slug": slug == null ? null : slug,
        "num_market_pairs": numMarketPairs == null ? null : numMarketPairs,
        "date_added": dateAdded == null ? null : dateAdded.toIso8601String(),
        "tags": tags == null
            ? null
            : List<dynamic>.from(tags.map((x) => tagValues.reverse[x])),
        "max_supply": maxSupply == null ? null : maxSupply,
        "circulating_supply":
            circulatingSupply == null ? null : circulatingSupply,
        "total_supply": totalSupply == null ? null : totalSupply,
        "platform": platform == null ? null : platform.toMap(),
        "cmc_rank": cmcRank == null ? null : cmcRank,
        "last_updated":
            lastUpdated == null ? null : lastUpdated.toIso8601String(),
        "quote": quote == null ? null : quote.toMap(),
      };
}

class Platform {
  int id;
  Name name;
  Symbol symbol;
  Slug slug;
  String tokenAddress;

  Platform({
    this.id,
    this.name,
    this.symbol,
    this.slug,
    this.tokenAddress,
  });

  factory Platform.fromMap(Map<String, dynamic> json) => Platform(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : nameValues.map[json["name"]],
        symbol:
            json["symbol"] == null ? null : symbolValues.map[json["symbol"]],
        slug: json["slug"] == null ? null : slugValues.map[json["slug"]],
        tokenAddress:
            json["token_address"] == null ? null : json["token_address"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "name": name == null ? null : nameValues.reverse[name],
        "symbol": symbol == null ? null : symbolValues.reverse[symbol],
        "slug": slug == null ? null : slugValues.reverse[slug],
        "token_address": tokenAddress == null ? null : tokenAddress,
      };
}

enum Name { OMNI, ETHEREUM, TRON, RSK_SMART_BITCOIN }

final nameValues = EnumValues({
  "Ethereum": Name.ETHEREUM,
  "Omni": Name.OMNI,
  "RSK Smart Bitcoin": Name.RSK_SMART_BITCOIN,
  "TRON": Name.TRON
});

enum Slug { OMNI, ETHEREUM, TRON, RSK_SMART_BITCOIN }

final slugValues = EnumValues({
  "ethereum": Slug.ETHEREUM,
  "omni": Slug.OMNI,
  "rsk-smart-bitcoin": Slug.RSK_SMART_BITCOIN,
  "tron": Slug.TRON
});

enum Symbol { OMNI, ETH, TRX, RBTC }

final symbolValues = EnumValues({
  "ETH": Symbol.ETH,
  "OMNI": Symbol.OMNI,
  "RBTC": Symbol.RBTC,
  "TRX": Symbol.TRX
});

class Quote {
  Usd usd;

  Quote({
    this.usd,
  });

  factory Quote.fromMap(Map<String, dynamic> json) => Quote(
        usd: json["USD"] == null ? null : Usd.fromMap(json["USD"]),
      );

  Map<String, dynamic> toMap() => {
        "USD": usd == null ? null : usd.toMap(),
      };
}

class Usd {
  double price;
  double volume24H;
  double percentChange1H;
  double percentChange24H;
  double percentChange7D;
  double marketCap;
  DateTime lastUpdated;

  Usd({
    this.price,
    this.volume24H,
    this.percentChange1H,
    this.percentChange24H,
    this.percentChange7D,
    this.marketCap,
    this.lastUpdated,
  });

  factory Usd.fromMap(Map<String, dynamic> json) => Usd(
        price: json["price"] == null ? null : json["price"].toDouble(),
        volume24H:
            json["volume_24h"] == null ? null : json["volume_24h"].toDouble(),
        percentChange1H: json["percent_change_1h"] == null
            ? null
            : json["percent_change_1h"].toDouble(),
        percentChange24H: json["percent_change_24h"] == null
            ? null
            : json["percent_change_24h"].toDouble(),
        percentChange7D: json["percent_change_7d"] == null
            ? null
            : json["percent_change_7d"].toDouble(),
        marketCap:
            json["market_cap"] == null ? null : json["market_cap"].toDouble(),
        lastUpdated: json["last_updated"] == null
            ? null
            : DateTime.parse(json["last_updated"]),
      );

  Map<String, dynamic> toMap() => {
        "price": price == null ? null : price,
        "volume_24h": volume24H == null ? null : volume24H,
        "percent_change_1h": percentChange1H == null ? null : percentChange1H,
        "percent_change_24h":
            percentChange24H == null ? null : percentChange24H,
        "percent_change_7d": percentChange7D == null ? null : percentChange7D,
        "market_cap": marketCap == null ? null : marketCap,
        "last_updated":
            lastUpdated == null ? null : lastUpdated.toIso8601String(),
      };
}

enum Tag { MINEABLE }

final tagValues = EnumValues({"mineable": Tag.MINEABLE});

class Status {
  DateTime timestamp;
  int errorCode;
  dynamic errorMessage;
  int elapsed;
  int creditCount;
  dynamic notice;

  Status({
    this.timestamp,
    this.errorCode,
    this.errorMessage,
    this.elapsed,
    this.creditCount,
    this.notice,
  });

  factory Status.fromMap(Map<String, dynamic> json) => Status(
        timestamp: json["timestamp"] == null
            ? null
            : DateTime.parse(json["timestamp"]),
        errorCode: json["error_code"] == null ? null : json["error_code"],
        errorMessage: json["error_message"],
        elapsed: json["elapsed"] == null ? null : json["elapsed"],
        creditCount: json["credit_count"] == null ? null : json["credit_count"],
        notice: json["notice"],
      );

  Map<String, dynamic> toMap() => {
        "timestamp": timestamp == null ? null : timestamp.toIso8601String(),
        "error_code": errorCode == null ? null : errorCode,
        "error_message": errorMessage,
        "elapsed": elapsed == null ? null : elapsed,
        "credit_count": creditCount == null ? null : creditCount,
        "notice": notice,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
