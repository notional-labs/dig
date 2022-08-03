import 'package:dig_mobile_app/app/definition/app_assets.dart';
import 'package:dig_mobile_app/app/designsystem/ds_colors.dart';
import 'package:dig_mobile_app/app/designsystem/ds_text_style.dart';
import 'package:flutter/material.dart';
import 'package:dig_mobile_app/app/extension/extension.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DSWalletAddressController extends ChangeNotifier {
  bool _shouldReset = false;

  void reset() {
    _shouldReset = true;
    notifyListeners();
    _shouldReset = false;
  }
}

class DSWalletAddress extends StatefulWidget {
  final String address;
  final DSWalletAddressController? controller;
  final Function(String)? onCopyToClipboardTap;

  const DSWalletAddress(
      {required this.address,
      this.controller,
      this.onCopyToClipboardTap,
      Key? key})
      : super(key: key);

  @override
  State<DSWalletAddress> createState() => _DSWalletAddressState();
}

class _DSWalletAddressState extends State<DSWalletAddress> {
  var _isCopied = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.controller?.addListener(() {
      if (widget.controller?._shouldReset ?? false) {
        setState(() {
          _isCopied = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: DSColors.silver2),
      child: Row(
        children: [
          Expanded(
            child: Text(
              widget.address.length > 20
                  ? widget.address.trimMiddleWithDot(20)
                  : widget.address,
              textAlign: TextAlign.center,
              maxLines: 1,
              style: DSTextStyle.tsMontserratT12R.copyWith(
                  color: DSColors.tundora, overflow: TextOverflow.clip),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              widget.onCopyToClipboardTap?.call(widget.address);
              setState(() {
                _isCopied = true;
              });
            },
            child: _isCopied
                ? SvgPicture.asset(
                    AppAssets.icCopied,
                    width: 16,
                    height: 16,
                    color: DSColors.jungleGreen,
                  )
                : Image.asset(
                    AppAssets.icCopy,
                    width: 16,
                    height: 16,
                    color: DSColors.tundora,
                  ),
          )
        ],
      ),
    );
  }
}
