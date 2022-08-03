import 'package:flutter/material.dart';

const double dividerHeight = 1;

enum _DSDividerType { horizontal, vertical }

class DSDivider extends StatelessWidget {
  final Color _color;
  final double thickness;
  final _DSDividerType _type;
  const DSDivider._(this._color, this.thickness, this._type);

  factory DSDivider.horizontal(
          {Color color = Colors.white, double thickness = dividerHeight}) =>
      DSDivider._(color, thickness, _DSDividerType.horizontal);

  factory DSDivider.vertical(
          {Color color = Colors.white, double thickness = dividerHeight}) =>
      DSDivider._(color, thickness, _DSDividerType.vertical);

  @override
  Widget build(BuildContext context) => Container(
        width: _type == _DSDividerType.vertical ? thickness : null,
        height: _type == _DSDividerType.horizontal ? thickness : null,
        color: _color,
      );
}
