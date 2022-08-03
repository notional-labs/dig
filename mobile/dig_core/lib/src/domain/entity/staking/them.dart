import 'package:dig_core/src/domain/entity/staking/picture.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'them.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Them extends Equatable {
  final String id;
  final Pictures pictures;

  const Them({this.id = '', this.pictures = const Pictures()});

  factory Them.fromJson(Map<String, dynamic> json) => _$ThemFromJson(json);

  Map<String, dynamic> toJson() => _$ThemToJson(this);

  Them copyWith({
    String? id,
    Pictures? pictures,
  }) {
    return Them(
      id: id ?? this.id,
      pictures: pictures ?? this.pictures,
    );
  }

  @override
  List<Object> get props => [id, pictures];
}
