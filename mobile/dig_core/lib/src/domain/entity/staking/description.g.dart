// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'description.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Description _$DescriptionFromJson(Map<String, dynamic> json) => Description(
      moniker: json['moniker'] as String? ?? '',
      identity: json['identity'] as String? ?? '',
      website: json['website'] as String? ?? '',
      securityContact: json['security_contact'] as String? ?? '',
      details: json['details'] as String? ?? '',
    );

Map<String, dynamic> _$DescriptionToJson(Description instance) =>
    <String, dynamic>{
      'moniker': instance.moniker,
      'identity': instance.identity,
      'website': instance.website,
      'security_contact': instance.securityContact,
      'details': instance.details,
    };
