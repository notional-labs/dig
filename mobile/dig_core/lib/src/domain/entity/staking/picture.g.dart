// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'picture.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pictures _$PicturesFromJson(Map<String, dynamic> json) => Pictures(
      primary: json['primary'] == null
          ? const Primary()
          : Primary.fromJson(json['primary'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PicturesToJson(Pictures instance) => <String, dynamic>{
      'primary': instance.primary,
    };
