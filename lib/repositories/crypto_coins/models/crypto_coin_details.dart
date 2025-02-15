import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';

part 'crypto_coin_details.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class CryptoCoinDetails extends Equatable {
  const CryptoCoinDetails({
    required this.toSymbol,
    required this.lastUpdate,
    required this.high24Hour,
    required this.low24Hour,
    required this.priceInUSD,
    required this.imageUrl,
  });

  @HiveField(0)
  @JsonKey(name: 'TOSYMBOL')
  final String toSymbol;

  @HiveField(1)
  @JsonKey(name: 'LASTUPDATE', toJson: _dateTimeToJson, fromJson: _dateTimeFromJson)
  final DateTime lastUpdate;


  @HiveField(2)
  @JsonKey(name: 'HIGH24HOUR')
  final double high24Hour;

  @HiveField(3)
  @JsonKey(name: 'LOW24HOUR')
  final double low24Hour;

  @HiveField(4)
  @JsonKey(name: 'PRICE')
  final double priceInUSD;

  @HiveField(5)
  @JsonKey(name: 'IMAGEURL')
  final String imageUrl;

  String get fullImageUrl => 'https://www.cryptocompare.com/$imageUrl';

  factory CryptoCoinDetails.fromJson(Map<String, dynamic> json) => _$CryptoCoinDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$CryptoCoinDetailsToJson(this);

  static int _dateTimeToJson(DateTime time) => time.millisecondsSinceEpoch;

  static DateTime _dateTimeFromJson(int milliseconds) => DateTime.fromMillisecondsSinceEpoch(milliseconds);

  @override
  List<Object?> get props => [
    priceInUSD,
    imageUrl,
    toSymbol,
    lastUpdate,
    high24Hour,
    low24Hour,
    priceInUSD,
    imageUrl,
  ];
}
