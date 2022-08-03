import 'package:dig_mobile_app/app/definition/app_assets.dart';
import 'package:dig_mobile_app/app/designsystem/ds_colors.dart';
import 'package:flutter/material.dart';

enum DSAvatarType { active, none }

class DSSecondAvatar extends StatelessWidget {
  final DSAvatarType type;
  final String? imageNetworkUrl;

  const DSSecondAvatar(
      {this.imageNetworkUrl, this.type = DSAvatarType.none, Key? key})
      : super(key: key);

  Color _resolveBackgroudColor() {
    switch (type) {
      case DSAvatarType.active:
        return DSColors.tulipTree;
      default:
        return Colors.white.withOpacity(0.5);
    }
  }

  Widget _resolveImage() {
    if (imageNetworkUrl == null || imageNetworkUrl!.isEmpty) {
      return Image.asset(
        AppAssets.icAvatarEmpty,
        color: _resolveBackgroudColor(),
        fit: BoxFit.contain,
      );
    }

    return Image.network(imageNetworkUrl!, fit: BoxFit.cover);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      height: 35,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: _resolveImage(),
    );
  }
}
