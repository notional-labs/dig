import 'package:dig_mobile_app/app/cubit/import_account/import_account_cubit.dart';
import 'package:dig_mobile_app/app/cubit/import_account/import_account_state.dart';
import 'package:dig_mobile_app/app/designsystem/ds_background.dart';
import 'package:dig_mobile_app/app/designsystem/ds_colors.dart';
import 'package:dig_mobile_app/app/designsystem/ds_primary_appbar.dart';
import 'package:dig_mobile_app/app/designsystem/ds_primary_button.dart';
import 'package:dig_mobile_app/app/designsystem/ds_text_style.dart';
import 'package:dig_mobile_app/app/designsystem/ds_underline_text_field.dart';
import 'package:dig_mobile_app/app/util/util.dart';
import 'package:dig_mobile_app/di/di.dart';
import 'package:dig_mobile_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImportAccountPage extends StatefulWidget {
  const ImportAccountPage({Key? key}) : super(key: key);

  @override
  State<ImportAccountPage> createState() => _ImportAccountPageState();
}

class _ImportAccountPageState extends State<ImportAccountPage> with WidgetUtil {
  final ImportAccountCubit _cubit = di();

  void _blocListener(context, state) {
    if (state is ImportAccountLoadingState) {
      showGlobalLoadingOverlay();
      return;
    }
    dismissGlobalLoadingOverlay();
    if (state is ImportAccountSuccessState) {
      BlocProvider.of<ImportAccountCubit>(context).goToNameAccountEvent();
      return;
    }
  }

  @override
  Widget build(BuildContext context) => DSBackground(
      onTap: () {
        closeGlobalKeyboard();
      },
      child: AnnotatedRegion(
        value: SystemUiOverlayStyle.light,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: BlocProvider(
            create: (_) => _cubit,
            child: BlocListener(
              bloc: _cubit,
              listener: _blocListener,
              child: SafeArea(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const _Header(),
                      const SizedBox(height: 15),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: const [
                              SizedBox(height: 15),
                              _Body(),
                              SizedBox(height: 15),
                            ],
                          ),
                        ),
                      ),
                      if (!checkKeyboardOpening(context)) const _FooterWidget(),
                    ]),
              ),
            ),
          ),
        ),
      ));
}

class _Header extends StatelessWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => DSPrimaryAppBar.action(
        onBackButtonPressed: () {
          BlocProvider.of<ImportAccountCubit>(context).backEvent();
        },
        action: GestureDetector(
          onTap: () {
            BlocProvider.of<ImportAccountCubit>(context).tapAdvancedEvent();
          },

          /// TODO: Impl `Advanced`
          child: Text('',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: DSTextStyle.tsMontserratT16R
                  .copyWith(color: DSColors.tulipTree)),
        ),
      );
}

class _Body extends StatelessWidget {
  const _Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.current.import_account,
              style: DSTextStyle.tsMontserratT20B
                  .copyWith(color: DSColors.tulipTree),
            ),
            const SizedBox(height: 15),
            Text(
              S.current.enter_your_recovery_phrase,
              style: DSTextStyle.tsMontserratT12R.copyWith(color: Colors.white),
            ),
            const SizedBox(height: 15),
            DSUnderlineTextField(
                onChange: (value) {
                  BlocProvider.of<ImportAccountCubit>(context)
                      .changeRecoveryPhraseEvent(value);
                },
                validator: (value) {
                  if ((value ?? '').isEmpty) {
                    return '';
                  }
                  final message = BlocProvider.of<ImportAccountCubit>(context)
                      .checkMnemonicValid(value!);
                  return message;
                },
                maxLine: null,
                textInputType: TextInputType.multiline,
                textInputAction: TextInputAction.done)
          ],
        ),
      );
}

class _FooterWidget extends StatelessWidget {
  const _FooterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<ImportAccountCubit, ImportAccountState>(
          builder: (_, state) => Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                child: DSPrimaryButton(
                    enable: state.viewmodel.isValid,
                    title: S.current.import,
                    onTap: () {
                      BlocProvider.of<ImportAccountCubit>(context)
                          .importEvent();
                    }),
              ));
}
