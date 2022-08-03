import 'package:dig_mobile_app/app/designsystem/ds_colors.dart';
import 'package:dig_mobile_app/app/designsystem/ds_text_style.dart';
import 'package:flutter/material.dart';

class DSProposalPercentageBar extends StatelessWidget {
  final double yes;
  final double abstain;
  final double no;
  final double noWithVeto;

  const DSProposalPercentageBar(
      {required this.yes,
      required this.abstain,
      required this.no,
      required this.noWithVeto,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: Row(
        children: [
          _buildPercentIndicator(yes, DSColors.jungleGreen),
          _buildPercentIndicator(abstain, DSColors.rockBlue),
          _buildPercentIndicator(no, DSColors.robRoy),
          _buildPercentIndicator(noWithVeto, DSColors.burntSienna)
        ],
      ),
    );
  }

  Widget _buildPercentIndicator(double value, Color color) {
    return Flexible(
        flex: value.toInt(),
        fit: FlexFit.tight,
        child: value == 0
            ? const SizedBox.shrink()
            : Container(
                height: 20,
                color: color,
                child: value < 10
                    ? const SizedBox.shrink()
                    : Align(
                        alignment: Alignment.center,
                        child: Text(
                          '$value%',
                          style: DSTextStyle.tsMontserratT10R
                              .copyWith(color: Colors.white),
                        ),
                      ),
              ));
  }
}
