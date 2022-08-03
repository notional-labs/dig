import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class DSQrCodeImage extends StatelessWidget {
  final String data;
  final double? size;

  const DSQrCodeImage({required this.data, this.size = 200, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: QrImage(
        data: data,
        size: size,
      ),
    );
  }
}
