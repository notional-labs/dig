// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'them.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Them _$ThemFromJson(Map<String, dynamic> json) => Them(
      id: json['id'] as String? ?? '',
      pictures: json['pictures'] == null
          ? const Pictures()
          : Pictures.fromJson(json['pictures'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ThemToJson(Them instance) => <String, dynamic>{
      'id': instance.id,
      'pictures': instance.pictures,
    };
