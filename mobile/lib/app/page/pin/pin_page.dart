import 'package:dig_mobile_app/app/cubit/pin/pin_cubit.dart';
import 'package:dig_mobile_app/app/cubit/pin/pin_state.dart';
import 'package:dig_mobile_app/app/designsystem/ds_background.dart';
import 'package:dig_mobile_app/app/designsystem/ds_colors.dart';
import 'package:dig_mobile_app/app/designsystem/ds_number_keyboard.dart';
import 'package:dig_mobile_app/app/designsystem/ds_pin_input.dart';
import 'package:dig_mobile_app/app/designsystem/ds_primary_appbar.dart';
import 'package:dig_mobile_app/app/designsystem/ds_snack_bar.dart';
import 'package:dig_mobile_app/app/designsystem/ds_text_style.dart';
import 'package:dig_mobile_app/app/util/util.dart';
import 'package:dig_mobile_app/di/di.dart';
import 'package:dig_mobile_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum PinPageType { create, authWhenLauchApp, authAfterAppPaused }

class PinPage extends StatefulWidget {
  final PinPageType type;
  const PinPage({required this.type, Key? key}) : super(key: key);

  @override
  State<PinPage> createState() => _PinPageState();
}

class _PinPageState extends State<PinPage> with WidgetUtil {
  final PinCubit _cubit = di();

  void _blocListener(_, state) {
    if (state is PinErrorState) {
      showGlobalDSSnackBar(
          message: state.exception.message, type: DSSnackBarType.error);
      return;
    }
    if (state is PinMatchedState) {
      dismissPINOverlay();
      if (widget.type == PinPageType.authWhenLauchApp) {
        _cubit.goToHomeEvent();
      }
      return;
    }
  }

  @override
  Widget build(BuildContext context) => DSBackground(
        child: AnnotatedRegion(
          value: SystemUiOverlayStyle.light,
          child: BlocProvider(
            create: (_) => _cubit,
            child: BlocListener(
              bloc: _cubit,
              listener: _blocListener,
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: SafeArea(
                  child: Column(
                    children: [
                      if (checkLandscape(context)) const SizedBox(height: 30),
                      _HeaderWidget(type: widget.type),
                      Expanded(
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: _BodyWidget(type: widget.type)),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}

class _HeaderWidget extends StatelessWidget with WidgetUtil {
  final PinPageType type;
  const _HeaderWidget({
    required this.type,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          if (canPop(context) && type != PinPageType.authAfterAppPaused)
            DSPrimaryAppBar.normal(
              onBackButtonPressed: () {
                BlocProvider.of<PinCubit>(context).backEvent();
              },
            ),
          const SizedBox(height: 38),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(S.current.enter_your_passcode,
                  style: DSTextStyle.tsMontserratT20B
                      .copyWith(color: DSColors.tulipTree)),
            ),
          ),
        ],
      );
}

class _BodyWidget extends StatefulWidget {
  final PinPageType type;
  const _BodyWidget({required this.type, Key? key}) : super(key: key);

  @override
  State<_BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<_BodyWidget> with WidgetUtil {
  final DSPinInputController _controller = DSPinInputController();

  void _resolveAction() {
    switch (widget.type) {
      case PinPageType.authWhenLauchApp:
      case PinPageType.authAfterAppPaused:
        BlocProvider.of<PinCubit>(context).matchPinEvent();
        break;
      case PinPageType.create:
        BlocProvider.of<PinCubit>(context).goToConfirmPinEvent();
        break;
      default:
        BlocProvider.of<PinCubit>(context).matchPinEvent();
        break;
    }
  }

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: DSPinInput(
                  controller: _controller,
                  onChange: (String pin) {
                    BlocProvider.of<PinCubit>(context).changePinEvent(pin);
                  },
                  onPINFit: (_) {
                    _resolveAction();
                    return Future.value(true);
                  },
                ),
              ),
            ),
          ),
          if (checkLandscape(context)) const SizedBox(height: 30),
          Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: checkLandscape(context)
                    ? SingleChildScrollView(
                        child: _keyboardWidget(),
                      )
                    : _keyboardWidget(),
              ))
        ],
      );

  Widget _keyboardWidget() => DSNumberKeyboard(
        onDeleteTap: () {
          _controller.delete();
        },
        onCancelTap: () {
          _controller.clear();
        },
        onNumberTap: (String number) {
          _controller.add(number);
        },
      );
}
