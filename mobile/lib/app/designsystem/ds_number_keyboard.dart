import 'package:dig_mobile_app/app/definition/app_assets.dart';
import 'package:dig_mobile_app/app/designsystem/ds_text_style.dart';
import 'package:dig_mobile_app/generated/l10n.dart';
import 'package:flutter/material.dart';

typedef OnDeleteTap = Function();
typedef OnCancelTap = Function();
typedef OnNumberTap = Function(String number);

class DSNumberKeyboard extends StatelessWidget {
  final OnDeleteTap onDeleteTap;
  final OnCancelTap onCancelTap;
  final OnNumberTap onNumberTap;
  final double verticalSpace;
  const DSNumberKeyboard(
      {required this.onDeleteTap,
      required this.onCancelTap,
      required this.onNumberTap,
      this.verticalSpace = 20,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _RowNumber(
            labels: const ['1', '2', '3'],
            onNumberTap: (String number) {
              onNumberTap(number);
            },
          ),
          SizedBox(height: verticalSpace),
          _RowNumber(
            labels: const ['4', '5', '6'],
            onNumberTap: (String number) {
              onNumberTap(number);
            },
          ),
          SizedBox(height: verticalSpace),
          _RowNumber(
            labels: const ['7', '8', '9'],
            onNumberTap: (String number) {
              onNumberTap(number);
            },
          ),
          SizedBox(height: verticalSpace),
          _RowBottom(
            leftLabel: S.current.cancel,
            betweenLabel: '0',
            rightLabel: Image.asset(
              AppAssets.icDeleteKeyboard,
              width: 20,
              height: 20,
            ),
            onLeftTap: () {
              onCancelTap();
            },
            onBetweenTap: () {
              onNumberTap('0');
            },
            onRighTap: () {
              onDeleteTap();
            },
          )
        ],
      );
}

class _RowNumber extends StatelessWidget {
  final List<String> labels;
  final OnNumberTap onNumberTap;
  const _RowNumber({required this.labels, required this.onNumberTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Expanded(
              child: GestureDetector(
            onTap: () {
              onNumberTap(labels[0]);
            },
            child: Container(
              color: Colors.transparent,
              alignment: Alignment.centerLeft,
              child: Text(
                labels[0],
                style:
                    DSTextStyle.tsMontserratT32B.copyWith(color: Colors.white),
              ),
            ),
          )),
          Expanded(
              child: GestureDetector(
            onTap: () {
              onNumberTap(labels[1]);
            },
            child: Container(
              color: Colors.transparent,
              alignment: Alignment.center,
              child: Text(
                labels[1],
                style:
                    DSTextStyle.tsMontserratT32B.copyWith(color: Colors.white),
              ),
            ),
          )),
          Expanded(
              child: GestureDetector(
            onTap: () {
              onNumberTap(labels[2]);
            },
            child: Container(
              color: Colors.transparent,
              alignment: Alignment.centerRight,
              child: Text(
                labels[2],
                style:
                    DSTextStyle.tsMontserratT32B.copyWith(color: Colors.white),
              ),
            ),
          ))
        ],
      );
}

class _RowBottom extends StatelessWidget {
  final String leftLabel;
  final String betweenLabel;
  final Widget rightLabel;
  final Function onLeftTap;
  final Function onBetweenTap;
  final Function onRighTap;
  const _RowBottom(
      {required this.leftLabel,
      required this.betweenLabel,
      required this.rightLabel,
      required this.onLeftTap,
      required this.onBetweenTap,
      required this.onRighTap,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                onLeftTap();
              },
              child: Container(
                color: Colors.transparent,
                alignment: Alignment.centerLeft,
                child: Text(
                  leftLabel,
                  style: DSTextStyle.tsMontserratT12R
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
          Expanded(
              child: GestureDetector(
            onTap: () {
              onBetweenTap();
            },
            child: Container(
              color: Colors.transparent,
              alignment: Alignment.center,
              child: Text(
                betweenLabel,
                style:
                    DSTextStyle.tsMontserratT32B.copyWith(color: Colors.white),
              ),
            ),
          )),
          Expanded(
              child: GestureDetector(
            onTap: () {
              onRighTap();
            },
            child: Container(
                color: Colors.transparent,
                alignment: Alignment.centerRight,
                child: rightLabel),
          ))
        ],
      );
}
