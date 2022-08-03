import 'package:dig_mobile_app/app/cubit/staking/staking_item/staking_item_cubit.dart';
import 'package:dig_mobile_app/app/cubit/staking/staking_item/staking_item_state.dart';
import 'package:dig_mobile_app/app/designsystem/ds_colors.dart';
import 'package:dig_mobile_app/app/designsystem/ds_second_avatar.dart';
import 'package:dig_mobile_app/app/designsystem/ds_small_button.dart';
import 'package:dig_mobile_app/app/designsystem/ds_text_style.dart';
import 'package:dig_mobile_app/app/viewmodel/staking_item_viewmodel.dart';
import 'package:dig_mobile_app/di/di.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StakingItem extends StatefulWidget {
  final StakingItemViewModel viewModel;
  final bool isLast;
  final VoidCallback onTap;
  const StakingItem(
      {required this.viewModel,
      required this.onTap,
      this.isLast = false,
      Key? key})
      : super(key: key);

  @override
  State<StakingItem> createState() => _StakingItemState();
}

class _StakingItemState extends State<StakingItem>
    with AutomaticKeepAliveClientMixin {
  final StakingItemCubit _cubit = di();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _cubit.fetchAvatar(widget.viewModel.identity);
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 19),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        _buildTopWidget(),
        const SizedBox(height: 20),
        _buildBottomWidget(),
        if (!widget.isLast)
          const Padding(
            padding: EdgeInsets.only(top: 20),
            child: Divider(
              color: DSColors.tulipTree,
            ),
          )
      ]),
    );
  }

  Widget _buildTopWidget() => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<StakingItemCubit, StakingItemState>(
              bloc: _cubit,
              builder: (context, state) {
                if (state is StakingItemLoadingAvatarState) {
                  return const SizedBox(
                      width: 40,
                      height: 40,
                      child: CupertinoActivityIndicator(
                        color: Colors.white,
                      ));
                }

                return ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: SizedBox(
                      width: 40,
                      height: 40,
                      child: DSSecondAvatar(
                        imageNetworkUrl: state.avatarUrl,
                        type: DSAvatarType.active,
                      )),
                );
              }),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.viewModel.name,
                  textAlign: TextAlign.start,
                  style: DSTextStyle.tsMontserratT20B
                      .copyWith(color: Colors.white),
                ),
                Text(
                  widget.viewModel.website,
                  style: DSTextStyle.tsMontserratT10R
                      .copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
          DSSmallButton(title: 'Delegate', onTap: widget.onTap)
        ],
      );

  Row _buildBottomWidget() => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'POWER',
                  textAlign: TextAlign.center,
                  style: DSTextStyle.tsMontserratT16B
                      .copyWith(color: DSColors.tulipTree),
                ),
                const SizedBox(height: 1),
                Text(
                  '${widget.viewModel.token} DIG',
                  textAlign: TextAlign.center,
                  style: DSTextStyle.tsMontserratT12B
                      .copyWith(color: Colors.white),
                ),
                const SizedBox(height: 3),
                Text(
                  '${widget.viewModel.power.toStringAsFixed(2)}%',
                  textAlign: TextAlign.center,
                  style: DSTextStyle.tsMontserratT10R
                      .copyWith(color: Colors.white),
                )
              ],
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('COMMSION',
                    textAlign: TextAlign.center,
                    style: DSTextStyle.tsMontserratT16B
                        .copyWith(color: DSColors.tulipTree)),
                const SizedBox(height: 1),
                Text(
                  '${widget.viewModel.commsion}%',
                  textAlign: TextAlign.center,
                  style: DSTextStyle.tsMontserratT12B
                      .copyWith(color: Colors.white),
                ),
              ],
            ),
          )
        ],
      );

  @override
  bool get wantKeepAlive => true;
}
