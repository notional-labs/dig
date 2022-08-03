// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Market _$MarketFromJson(Map<String, dynamic> json) => Market(
      id: json['id'] as String? ?? '',
      symbol: json['symbol'] as String? ?? '',
      name: json['name'] as String? ?? '',
      image: json['image'] as String? ?? '',
      currentPrice: json['current_price'] as num? ?? 0,
      marketCap: json['market_cap'] as num? ?? 0,
      marketCapRank: json['market_cap_rank'] as num? ?? 0,
      fullyDilutedValuation: json['fully_diluted_valuation'] as num? ?? 0,
      totalVolume: json['total_volume'] as num? ?? 0,
      high24h: json['high_24h'] as num? ?? 0,
      low24h: json['low_24h'] as num? ?? 0,
      priceChange24h: json['price_change_24h'] as num? ?? 0,
      priceChangePercentage24h:
          json['price_change_percentage_24h'] as num? ?? 0,
      marketCapChange24h: json['market_cap_change_24h'] as num? ?? 0,
      marketCapChangePercentage24h:
          json['market_cap_change_percentage_24h'] as num? ?? 0,
      circulatingSupply: json['circulating_supply'] as num? ?? 0,
      totalSupply: json['total_supply'] as num? ?? 0,
      maxSupply: json['max_supply'] as num? ?? 0,
      ath: json['ath'] as num? ?? 0,
      athChangePercentage: json['ath_change_percentage'] as num? ?? 0,
      athDate: json['ath_date'] as String? ?? '',
      atl: json['atl'] as num? ?? 0,
      atlChangePercentage:
          (json['atl_change_percentage'] as num?)?.toDouble() ?? 0,
      atlDate: json['atl_date'] as String? ?? '',
      lastUpdated: json['last_updated'] as String? ?? '',
    );

Map<String, dynamic> _$MarketToJson(Market instance) => <String, dynamic>{
      'id': instance.id,
      'symbol': instance.symbol,
      'name': instance.name,
      'image': instance.image,
      'current_price': instance.currentPrice,
      'market_cap': instance.marketCap,
      'market_cap_rank': instance.marketCapRank,
      'fully_diluted_valuation': instance.fullyDilutedValuation,
      'total_volume': instance.totalVolume,
      'high_24h': instance.high24h,
      'low_24h': instance.low24h,
      'price_change_24h': instance.priceChange24h,
      'price_change_percentage_24h': instance.priceChangePercentage24h,
      'market_cap_change_24h': instance.marketCapChange24h,
      'market_cap_change_percentage_24h': instance.marketCapChangePercentage24h,
      'circulating_supply': instance.circulatingSupply,
      'total_supply': instance.totalSupply,
      'max_supply': instance.maxSupply,
      'ath': instance.ath,
      'ath_change_percentage': instance.athChangePercentage,
      'ath_date': instance.athDate,
      'atl': instance.atl,
      'atl_change_percentage': instance.atlChangePercentage,
      'atl_date': instance.atlDate,
      'last_updated': instance.lastUpdated,
    };
