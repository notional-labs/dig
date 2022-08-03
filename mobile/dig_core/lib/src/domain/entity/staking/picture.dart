import 'package:dig_core/src/domain/entity/staking/primary.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'picture.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Pictures extends Equatable {
  final Primary primary;

  const Pictures({
    this.primary = const Primary(),
  });

  factory Pictures.fromJson(Map<String, dynamic> json) =>
      _$PicturesFromJson(json);

  Map<String, dynamic> toJson() => _$PicturesToJson(this);

  Pictures copyWith({
    Primary? primary,
  }) {
    return Pictures(
      primary: primary ?? this.primary,
    );
  }

  @override
  List<Object> get props => [primary];
}
