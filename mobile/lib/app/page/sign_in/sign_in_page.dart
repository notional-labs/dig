import 'package:dig_mobile_app/app/cubit/sign_in/sign_in_cubit.dart';
import 'package:dig_mobile_app/app/definition/app_assets.dart';
import 'package:dig_mobile_app/app/designsystem/ds_background.dart';
import 'package:dig_mobile_app/app/designsystem/ds_colors.dart';
import 'package:dig_mobile_app/app/designsystem/ds_text_style.dart';
import 'package:dig_mobile_app/app/util/util.dart';
import 'package:dig_mobile_app/di/di.dart';
import 'package:dig_mobile_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with WidgetUtil {
  final SignInCubit _cubit = di();

  @override
  Widget build(BuildContext context) => BlocProvider<SignInCubit>(
        create: (BuildContext context) => _cubit,
        child: _bodyWidget(),
      );

  Widget _bodyWidget() => DSBackground(
        onTap: () {
          closeGlobalKeyboard();
        },
        child: AnnotatedRegion(
          value: SystemUiOverlayStyle.light,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 27),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            SizedBox(height: 30),
                            _HeaderWidget(),
                            SizedBox(height: 100),
                            _BodyWidget(),
                            SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (!checkKeyboardOpening(context))
                    const Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 15),
                        child: _BottomWidget())
                ],
              ),
            ),
          ),
        ),
      );
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Image.asset(
        AppAssets.icDigLogoWithText,
        width: 68,
        height: 50,
      );
}

class _BodyWidget extends StatelessWidget with WidgetUtil {
  const _BodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        width: double.infinity,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            S.current.welcome,
            style: DSTextStyle.tsMontserratT40B
                .copyWith(color: DSColors.tulipTree),
          ),
          const SizedBox(height: 5),
          Text(
            S.current.to_digchain,
            style: DSTextStyle.tsMontserratT24B.copyWith(
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 60),
          GestureDetector(
            onTap: () {
              BlocProvider.of<SignInCubit>(context).goToBackUpWalletEvent();
            },
            child: Container(
              color: Colors.transparent,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    AppAssets.icCreateAccount,
                    width: 38,
                    height: 38,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      S.current.create_account,
                      style: DSTextStyle.tsMontserratT20B
                          .copyWith(color: DSColors.tulipTree),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 63),
          GestureDetector(
            onTap: () {
              BlocProvider.of<SignInCubit>(context).goToImportAccountEvent();
            },
            child: Container(
              color: Colors.transparent,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    AppAssets.icImportAccount,
                    width: 38,
                    height: 38,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      S.current.import_account,
                      style: DSTextStyle.tsMontserratT20B
                          .copyWith(color: DSColors.tulipTree),
                    ),
                  )
                ],
              ),
            ),
          ),
        ]),
      );
}

class _BottomWidget extends StatelessWidget {
  const _BottomWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Text(
        S.current.copyright_digchain(DateTime.now().year),
        style: DSTextStyle.tsMontserratT12R.copyWith(color: Colors.white),
      );
}
