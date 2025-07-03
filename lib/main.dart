import 'dart:ui';

import 'package:world_explorer/presentation/pages/country_page.dart';
import 'package:world_explorer/providers/country_view_model_provider.dart';
import 'package:world_explorer/tools/shared_preferences_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // or your desired color
      statusBarIconBrightness: Brightness.dark, // or Brightness.light
    ),
  );
  await dotenv.load();
  await SharedPreferencesHelper.init();
  runApp(const ProviderScope(child: WorldExplorerApp()));


  // Post-frame callback (does not delay UI)
  WidgetsBinding.instance.addPostFrameCallback((_) async {
    await Firebase.initializeApp();
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };

  });
}

class WorldExplorerApp extends StatelessWidget {
  const WorldExplorerApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // debug badge
      title: 'World Explorer',
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('de'),
      ],
      theme: ThemeData(useMaterial3: true, brightness: Brightness.light),
      home: Consumer(
        builder: (context, ref, _) {
          return CountryPage();
        },
      ),
    );
  }
}