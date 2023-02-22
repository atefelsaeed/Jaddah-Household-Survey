import 'dart:convert';

import 'package:enum_to_string/enum_to_string.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:jaddah_household_survey/Models/HHS_SurvyModels/survey_hhs.dart';
import 'package:jaddah_household_survey/Providers/survey_hhs.dart';
import 'package:jaddah_household_survey/UI/Screens/SplashScreen/splashScreen.dart';
import 'package:jaddah_household_survey/UI/Screens/Survey/actions/action_survey_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Data/Enums/hhs_enums.dart';
import 'Helper/LifecycleEventHandlerClass.dart';
import 'Providers/auth.dart';
import 'Providers/surveys.dart';
import 'Providers/user_surveys.dart';
import 'Resources/colors.dart';
import 'UI/Screens/Login/login_screen.dart';
import 'UI/Screens/Splash/splash_screen.dart';
import 'UI/Screens/vechicles/provider/vechiels_provider.dart';

Future<void> _messageHandler(RemoteMessage message) async {
  debugPrint('will sync');
  syncall();
}

Future<bool> syncall() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.reload();
  prefs.setBool('dontsync', true);
  if (!prefs.containsKey("surveys")) return false;
  var surveysList = prefs.getStringList("surveys")!;
  final _surveys = [];
  for (Map<String, dynamic> s in surveysList.map(json.decode).toList()) {
    switch (EnumToString.fromString(SurveyType.values, s['type'],
        camelCase: true)!) {
      case SurveyType.pt:
        _surveys.add(SurveyPT.fromJson(s));
        break;
      default:
    }
  }
  for (var e in _surveys) {
    debugPrint('main');
    debugPrint(e.synced);
  }
  // Survey ?i;
  // await i!.provider.multiSync(force: true);
  // for (Survey i in _surveys) {
  //   debugPrint(i.header.interviewNumber);
  //   await i.provider.sync(force: true);
  // }
  for (var e in _surveys) {
    debugPrint(e.synced);
  }

  prefs
      .setStringList(
        "surveys",
        _surveys.map((v) => json.encode(v.toJson())).toList(),
      )
      .then((value) => debugPrint("done"))
      .onError(
    (error, stackTrace) {
      debugPrint(error.toString());
      return false;
    },
  );
  prefs.setBool('dontsync', false);
  debugPrint(_surveys.map((v) => json.encode(v.toJson())).toList().toString());
  return true;
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  debugPrint("something");
  Firebase.initializeApp().then((value) async {
    FirebaseMessaging.instance.subscribeToTopic('sync');
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('SystemStatus', 'Online');
    prefs.setBool('dontsync', false);
    FirebaseMessaging.onBackgroundMessage(_messageHandler);
  });
  debugPrint("second thing");

  Intl.defaultLocale = 'ar_EG';
  runApp(const MyApp());
}

GlobalKey<NavigatorState> navigatorKey = GlobalKey();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(
      LifecycleEventHandler(
        resumeCallBack: () async => setState(
          () {
            debugPrint("returned to app");
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SurveyPTProvider(SurveyPT())),
        ChangeNotifierProvider(
          create: (_) => ActionSurveyProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => VecProvider(),
        ),
        ChangeNotifierProvider<Auth>(create: (ctx) => Auth()),
        ChangeNotifierProvider<UserSurveysProvider>(
            create: (ctx) => UserSurveysProvider()),
        ChangeNotifierProxyProvider<Auth, SurveysProvider>(
          create: (ctx) => SurveysProvider(),
          update: (ctx, _auth, _old) =>
              SurveysProvider.auth(_auth.authHeader, _auth.uid, _old!),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Jaddah Household Survey',
        navigatorKey: navigatorKey,
        theme: ThemeData(
            primaryColor: ColorManager.primaryColor, fontFamily: 'Somar'),
        localizationsDelegates: const [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale("ar"), // OR Locale('ar', 'AE') OR Other RTL locales
        ],
        locale: const Locale("ar"),
        routes: {
          SplashScreen.routeName: (ctx) => const SplashScreen(),
          LoginScreen.routeName: (ctx) => const LoginScreen(),
        },
        home: const SplashView(),
      ),
    );
  }
}
