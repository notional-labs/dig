import 'package:dig_mobile_app/app/cubit/app/app_cubit.dart';
import 'package:dig_mobile_app/app/definition/locale.dart';
import 'package:dig_mobile_app/app/definition/string.dart';
import 'package:dig_mobile_app/app/route/dig_route.dart';
import 'package:dig_mobile_app/app/util/util.dart';
import 'package:dig_mobile_app/di/di.dart';
import 'package:dig_mobile_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver, WidgetUtil {
  final AppCubit _cubit = di();
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: MaterialApp(
        builder: ((context, child) => MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child!)),
        debugShowCheckedModeBanner: false,
        initialRoute: DigPageName.splash,
        navigatorKey: navigatorKey,
        onGenerateRoute: (settings) => DigRoute().generateRoute(settings),
        supportedLocales: DigLocale.supportedLocale,

        /// TODO: Uncomment after setup Firebase
        // navigatorObservers: <NavigatorObserver>[
        //   FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance)
        // ],
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          final hasSupported =
              supportedLocales.any((element) => element == locale);
          if (hasSupported) {
            return locale;
          }
          return DigLocale.defaultLocale;
        },
      ),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      _cubit.shouldEnterPIN().then((value) {
        if (value) {
          showEnterPINOverlay();
        }
      });
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
