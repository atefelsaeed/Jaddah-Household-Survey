import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:jaddah_household_survey/Models/HHS_SurvyModels/survey_hhs.dart';
import 'package:jaddah_household_survey/Providers/survey_hhs.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Helper/LifecycleEventHandlerClass.dart';
import 'Helper/messageHandler.dart';
import 'Providers/auth.dart';
import 'Providers/surveys.dart';
import 'Resources/colors.dart';
import 'UI/Screens/Home/homeScreen.dart';
import 'UI/Screens/Login/login_screen.dart';
import 'UI/Screens/Splash/splash_screen.dart';
import 'UI/Screens/Surveies/surveys_screen.dart';
import 'UI/Screens/Survey/syrvey_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  print("something");
  Firebase.initializeApp().then((value) async {
    FirebaseMessaging.instance.subscribeToTopic('sync');
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('dontsync', false);
    FirebaseMessaging.onBackgroundMessage(messageHandler);
  });
  print("second thing");

  Intl.defaultLocale = 'ar_EG';
  runApp(const MyApp());
}

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
            print("returned to app");
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
        ChangeNotifierProvider<Auth>(create: (ctx) => Auth()),
        ChangeNotifierProxyProvider<Auth, SurveysProvider>(
          create: (ctx) => SurveysProvider(),
          update: (ctx, _auth, _old) =>
              SurveysProvider.auth(_auth.authHeader, _auth.uid, _old!),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Jaddah Household Survey',
        theme: ThemeData(
          primaryColor: ColorManager.primaryColor,
        ),
        localizationsDelegates: const [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale("en"), // OR Locale('ar', 'AE') OR Other RTL locales
        ],
        locale: const Locale("en"),
        routes: {
          SplashScreen.routeName: (ctx) => const SplashScreen(),
          LoginScreen.routeName: (ctx) => const LoginScreen(),
        },
        home: const HomeScreen(),
      ),
    );
  }
}
