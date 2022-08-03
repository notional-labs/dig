import 'package:dig_mobile_app/app/definition/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:dig_mobile_app/generated/l10n.dart';
import 'package:dig_mobile_app/app/designsystem/ds_background.dart';
import 'package:dig_mobile_app/app/designsystem/ds_primary_appbar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:dig_mobile_app/app/designsystem/ds_colors.dart';
import 'package:dig_mobile_app/app/designsystem/ds_text_style.dart';

class ActiveAccountDetailPage extends StatelessWidget {
  const ActiveAccountDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<PieChartSeries> data = [
      PieChartSeries('Balance', 0.58, 2637.83, 0,
          const Color.fromRGBO(42, 157, 143, 1), AppAssets.icBalance),
      PieChartSeries('Delegation', 99.33, 4502, 0,
          const Color.fromRGBO(156, 183, 211, 1), AppAssets.icDelegation),
      PieChartSeries('Reward', 0.58, 374.79, 0,
          const Color.fromRGBO(233, 196, 106, 1), AppAssets.icReward),
      PieChartSeries('Unbonding', 0.0, 100, 0,
          const Color.fromRGBO(231, 111, 81, 1), AppAssets.icUnbonding),
    ];

    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
          body: DSBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DSPrimaryAppBar.normal(
                  title: S.current.proposal_detail_page_title,
                  onBackButtonPressed: () => Navigator.of(context).pop(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Text('Assets',
                      style: DSTextStyle.tsMontserratT20B
                          .copyWith(color: DSColors.tulipTree)),
                ),
                Center(
                    child: SizedBox(
                        width: MediaQueryData.fromWindow(
                                    WidgetsBinding.instance.window)
                                .devicePixelRatio *
                            70,
                        height: MediaQueryData.fromWindow(
                                    WidgetsBinding.instance.window)
                                .devicePixelRatio *
                            70,
                        child: SfCircularChart(series: <CircularSeries>[
                          // Renders doughnut chart
                          DoughnutSeries<PieChartSeries, String>(
                              dataSource: data,
                              innerRadius: '70%',
                              pointColorMapper: (PieChartSeries data, _) =>
                                  data.color,
                              xValueMapper: (PieChartSeries data, _) =>
                                  data.name,
                              yValueMapper: (PieChartSeries data, _) =>
                                  data.digValue)
                        ]))),
                const SizedBox(
                  height: 20.0,
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return AssetsDetailItem(pieChartSeries: data[index]);
                    }),
                const SizedBox(
                  height: 7.0,
                ),
                const Divider(color: Colors.white, thickness: 2),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Total: 0\$',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}

class PieChartSeries {
  final String name;
  final double percentage;
  final double digValue;
  final double value;
  final Color color;
  final String image;

  PieChartSeries(this.name, this.percentage, this.digValue, this.value,
      this.color, this.image);
}

class AssetsDetailItem extends StatelessWidget {
  final PieChartSeries pieChartSeries;
  const AssetsDetailItem({required this.pieChartSeries, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 7.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            width: 20.0,
            height: 20.0,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(4.0)),
              color: pieChartSeries.color,
            ),
            child: Center(
              child: SvgPicture.asset(pieChartSeries.image),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 5.0, top: 2.0),
            child: Text(
              pieChartSeries.name,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2.0),
            child: Text('${pieChartSeries.percentage}%',
                style: const TextStyle(color: Colors.white)),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(top: 2.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${pieChartSeries.digValue} DIG',
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Text('\$${pieChartSeries.value}',
                    style: const TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
