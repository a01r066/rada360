import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rada360/config/routes.dart';
import 'package:rada360/config/services_locator.dart';
import 'package:rada360/gen/localization/l10n.dart';
import 'package:rada360/presentation/splash/splash_page.dart';

Future initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: kIsWeb
          ? HydratedStorage.webStorageDirectory
          : await getApplicationDocumentsDirectory());
  // await HydratedBloc.storage.clear();

  await setupServicesLocator();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

final mainNavigatorKey = GlobalKey<NavigatorState>();
final myAppStateKey = GlobalKey<_MyAppState>();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'MagicSwap',
        debugShowCheckedModeBanner: false,
        navigatorKey: mainNavigatorKey,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        localeResolutionCallback:
            (Locale? locale, Iterable<Locale> supportedLocales) {
          return locale;
        },
        // onGenerateTitle: (BuildContext context) => S.current.app_name,
        onGenerateRoute: Routes.generateRoute,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.light,
        builder: (BuildContext context, Widget? child) {
          // Prevent system prefer font size
          final textScale = Platform.isIOS ? 1.0 : 1.0;
          Widget fixedFontSizeWidget = MediaQuery(
              data: MediaQuery.of(context)
                  .copyWith(textScaler: TextScaler.linear(textScale)),
              child: child ?? Container());

          return fixedFontSizeWidget;
        },
        home: const SplashPage());
  }
}