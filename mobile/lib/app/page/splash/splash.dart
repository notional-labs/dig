import 'package:dig_mobile_app/app/cubit/splash/splash_cubit.dart';
import 'package:dig_mobile_app/app/definition/app_assets.dart';
import 'package:dig_mobile_app/app/designsystem/ds_background.dart';
import 'package:dig_mobile_app/app/designsystem/ds_colors.dart';
import 'package:dig_mobile_app/app/designsystem/ds_text_style.dart';
import 'package:dig_mobile_app/di/di.dart';
import 'package:dig_mobile_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const Duration _animateDurationTitle = Duration(milliseconds: 500);
const Duration _animateDurationDescription = Duration(milliseconds: 450);

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final SplashCubit _cubit = di();
  double _widthOfContainerTitle = 0;
  double _widthOfContainerUnderTitle = 0;
  bool _showArrowIcon = false;

  double get _widthOfTextTitle {
    final TextPainter textPainter = TextPainter()
      ..text = TextSpan(
          text: S.current.ig_chain,
          style:
              DSTextStyle.tsMontserratT35B.copyWith(color: DSColors.tulipTree))
      ..textDirection = TextDirection.ltr
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size.width;
  }

  double get _widthOfUnderTextTitle {
    final TextPainter textPainter = TextPainter()
      ..text = TextSpan(
          text: S.current.into_the_mine,
          style: DSTextStyle.tsMontserratT20R.copyWith(color: Colors.white))
      ..textDirection = TextDirection.ltr
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size.width;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 1)).then((value) {
        setState(() {
          _widthOfContainerTitle = _widthOfTextTitle;
          _widthOfContainerUnderTitle = _widthOfUnderTextTitle + 16 + 8;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) => AnnotatedRegion(
        value: SystemUiOverlayStyle.light,
        child: Scaffold(
          body: DSBackground(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image.asset(
                      AppAssets.icDigLogo,
                      width: 76,
                      height: 76,
                    ),
                    AnimatedContainer(
                      width: _widthOfContainerTitle,
                      color: Colors.transparent,
                      duration: _animateDurationTitle,
                      child: Text(
                        S.current.ig_chain,
                        softWrap: false,
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                        style: DSTextStyle.tsMontserratT35B
                            .copyWith(color: DSColors.tulipTree),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  //color: Colors.red,
                  width: _widthOfUnderTextTitle + 16 + 8,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: AnimatedContainer(
                      width: _widthOfContainerUnderTitle,
                      duration: _animateDurationDescription,
                      onEnd: () {
                        setState(() {
                          _showArrowIcon = true;
                        });
                        _cubit.checkAuthentication();
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              S.current.into_the_mine,
                              softWrap: false,
                              maxLines: 1,
                              overflow: TextOverflow.clip,
                              style: DSTextStyle.tsMontserratT20R
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                          const SizedBox(width: 8),
                          if (_showArrowIcon)
                            Image.asset(
                              AppAssets.icArrowRight,
                              width: 16,
                              height: 14,
                            ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
}
