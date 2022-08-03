import 'package:dig_mobile_app/app/designsystem/ds_colors.dart';
import 'package:dig_mobile_app/app/designsystem/ds_text_style.dart';
import 'package:flutter/material.dart';

enum _DSPrimaryAppBarType { normal, action }

class DSPrimaryAppBar extends StatelessWidget {
  final _DSPrimaryAppBarType type;
  final String title;
  final Widget action;
  final GestureTapCallback? onBackButtonPressed;

  const DSPrimaryAppBar._(
      this.type, this.title, this.action, this.onBackButtonPressed);

  factory DSPrimaryAppBar.normal(
          {String title = '', GestureTapCallback? onBackButtonPressed}) =>
      DSPrimaryAppBar._(_DSPrimaryAppBarType.normal, title,
          const SizedBox.shrink(), onBackButtonPressed);

  factory DSPrimaryAppBar.action(
          {Widget action = const SizedBox.shrink(),
          GestureTapCallback? onBackButtonPressed}) =>
      DSPrimaryAppBar._(
          _DSPrimaryAppBarType.action, '', action, onBackButtonPressed);

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case _DSPrimaryAppBarType.normal:
        return _Normal(onBackButtonPressed: onBackButtonPressed, title: title);
      case _DSPrimaryAppBarType.action:
        return _Action(
            action: action, onBackButtonPressed: onBackButtonPressed);
      default:
        return _Normal(onBackButtonPressed: onBackButtonPressed, title: title);
    }
  }
}

class _Normal extends StatelessWidget {
  const _Normal({
    required this.onBackButtonPressed,
    required this.title,
    Key? key,
  }) : super(key: key);

  final GestureTapCallback? onBackButtonPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (onBackButtonPressed != null)
          InkResponse(
            onTap: onBackButtonPressed,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Icon(
                Icons.arrow_back_ios,
                color: DSColors.tulipTree,
                size: 24,
              ),
            ),
          ),
        Expanded(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: DSTextStyle.tsMontserratT24B
                .copyWith(color: DSColors.tulipTree),
          ),
        ),
        if (onBackButtonPressed != null)
          const SizedBox(
            width: 84,
          )
      ],
    );
  }
}

class _Action extends StatelessWidget {
  const _Action({
    required this.onBackButtonPressed,
    required this.action,
    Key? key,
  }) : super(key: key);

  final GestureTapCallback? onBackButtonPressed;
  final Widget action;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (onBackButtonPressed != null)
          InkResponse(
            onTap: onBackButtonPressed,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Icon(
                Icons.arrow_back_ios,
                color: DSColors.tulipTree,
                size: 24,
              ),
            ),
          ),
        const Expanded(
          child: SizedBox.shrink(),
        ),
        if (action != const SizedBox.shrink())
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: action,
          )
      ],
    );
  }
}
