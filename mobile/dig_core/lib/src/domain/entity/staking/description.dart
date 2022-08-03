import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'description.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Description extends Equatable {
  final String moniker;
  final String identity;
  final String website;
  final String securityContact;
  final String details;

  const Description({
    this.moniker = '',
    this.identity = '',
    this.website = '',
    this.securityContact = '',
    this.details = '',
  });

  factory Description.fromJson(Map<String, dynamic> json) =>
      _$DescriptionFromJson(json);

  Map<String, dynamic> toJson() => _$DescriptionToJson(this);

  Description copyWith({
    String? moniker,
    String? identity,
    String? website,
    String? securityContact,
    String? details,
  }) {
    return Description(
      moniker: moniker ?? this.moniker,
      identity: identity ?? this.identity,
      website: website ?? this.website,
      securityContact: securityContact ?? this.securityContact,
      details: details ?? this.details,
    );
  }

  @override
  List<Object> get props {
    return [
      moniker,
      identity,
      website,
      securityContact,
      details,
    ];
  }
}
