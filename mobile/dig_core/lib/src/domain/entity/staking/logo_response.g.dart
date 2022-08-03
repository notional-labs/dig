// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logo_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogoResponse _$LogoResponseFromJson(Map<String, dynamic> json) => LogoResponse(
      status: json['status'] == null
          ? const Status()
          : Status.fromJson(json['status'] as Map<String, dynamic>),
      them: (json['them'] as List<dynamic>?)
              ?.map((e) => Them.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$LogoResponseToJson(LogoResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'them': instance.them,
    };
