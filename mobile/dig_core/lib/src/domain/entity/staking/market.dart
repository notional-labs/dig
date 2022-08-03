import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'market.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Market extends Equatable {
  final String id;
  final String symbol;
  final String name;
  final String image;
  final num currentPrice;
  final num marketCap;
  final num marketCapRank;
  final num fullyDilutedValuation;
  final num totalVolume;
  @JsonKey(name: 'high_24h')
  final num high24h;
  @JsonKey(name: 'low_24h')
  final num low24h;
  @JsonKey(name: 'price_change_24h')
  final num priceChange24h;
  @JsonKey(name: 'price_change_percentage_24h')
  final num priceChangePercentage24h;
  @JsonKey(name: 'market_cap_change_24h')
  final num marketCapChange24h;
  @JsonKey(name: 'market_cap_change_percentage_24h')
  final num marketCapChangePercentage24h;
  final num circulatingSupply;
  final num totalSupply;
  final num maxSupply;
  final num ath;
  final num athChangePercentage;
  final String athDate;
  final num atl;
  final double atlChangePercentage;
  final String atlDate;
  final String lastUpdated;
  const Market({
    this.id = '',
    this.symbol = '',
    this.name = '',
    this.image = '',
    this.currentPrice = 0,
    this.marketCap = 0,
    this.marketCapRank = 0,
    this.fullyDilutedValuation = 0,
    this.totalVolume = 0,
    this.high24h = 0,
    this.low24h = 0,
    this.priceChange24h = 0,
    this.priceChangePercentage24h = 0,
    this.marketCapChange24h = 0,
    this.marketCapChangePercentage24h = 0,
    this.circulatingSupply = 0,
    this.totalSupply = 0,
    this.maxSupply = 0,
    this.ath = 0,
    this.athChangePercentage = 0,
    this.athDate = '',
    this.atl = 0,
    this.atlChangePercentage = 0,
    this.atlDate = '',
    this.lastUpdated = '',
  });

  factory Market.fromJson(Map<String, dynamic> json) => _$MarketFromJson(json);

  Map<String, dynamic> toJson() => _$MarketToJson(this);

  Market copyWith({
    String? id,
    String? symbol,
    String? name,
    String? image,
    num? currentPrice,
    num? marketCap,
    num? marketCapRank,
    num? fullyDilutedValuation,
    num? totalVolume,
    num? high24h,
    num? low24h,
    num? priceChange24h,
    num? priceChangePercentage24h,
    num? marketCapChange24h,
    num? marketCapChangePercentage24h,
    num? circulatingSupply,
    num? totalSupply,
    num? maxSupply,
    num? ath,
    num? athChangePercentage,
    String? athDate,
    num? atl,
    double? atlChangePercentage,
    String? atlDate,
    String? lastUpdated,
  }) {
    return Market(
      id: id ?? this.id,
      symbol: symbol ?? this.symbol,
      name: name ?? this.name,
      image: image ?? this.image,
      currentPrice: currentPrice ?? this.currentPrice,
      marketCap: marketCap ?? this.marketCap,
      marketCapRank: marketCapRank ?? this.marketCapRank,
      fullyDilutedValuation:
          fullyDilutedValuation ?? this.fullyDilutedValuation,
      totalVolume: totalVolume ?? this.totalVolume,
      high24h: high24h ?? this.high24h,
      low24h: low24h ?? this.low24h,
      priceChange24h: priceChange24h ?? this.priceChange24h,
      priceChangePercentage24h:
          priceChangePercentage24h ?? this.priceChangePercentage24h,
      marketCapChange24h: marketCapChange24h ?? this.marketCapChange24h,
      marketCapChangePercentage24h:
          marketCapChangePercentage24h ?? this.marketCapChangePercentage24h,
      circulatingSupply: circulatingSupply ?? this.circulatingSupply,
      totalSupply: totalSupply ?? this.totalSupply,
      maxSupply: maxSupply ?? this.maxSupply,
      ath: ath ?? this.ath,
      athChangePercentage: athChangePercentage ?? this.athChangePercentage,
      athDate: athDate ?? this.athDate,
      atl: atl ?? this.atl,
      atlChangePercentage: atlChangePercentage ?? this.atlChangePercentage,
      atlDate: atlDate ?? this.atlDate,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }

  @override
  List<Object> get props {
    return [
      id,
      symbol,
      name,
      image,
      currentPrice,
      marketCap,
      marketCapRank,
      fullyDilutedValuation,
      totalVolume,
      high24h,
      low24h,
      priceChange24h,
      priceChangePercentage24h,
      marketCapChange24h,
      marketCapChangePercentage24h,
      circulatingSupply,
      totalSupply,
      maxSupply,
      ath,
      athChangePercentage,
      athDate,
      atl,
      atlChangePercentage,
      atlDate,
      lastUpdated,
    ];
  }
}
