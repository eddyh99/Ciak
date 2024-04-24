import 'package:ciak_app/views/frontscreen/signup/notif_signup_view.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ciak_app/utils/extensions.dart';
import 'package:google_fonts/google_fonts.dart';

import 'views/frontscreen/splashcreen/splashscreen.dart';
import 'views/frontscreen/login/login_view.dart';
import 'views/frontscreen/splashcreen/introscreen.dart';
import 'package:ciak_app/views/frontscreen/landing_view.dart';
import 'package:ciak_app/views/frontscreen/homepage/homepage_view.dart';
import 'package:ciak_app/views/frontscreen/signup/signup_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class NoGlowScrollBehavior extends MaterialScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'CIAK LIVE',
        scrollBehavior: NoGlowScrollBehavior(),
        theme: ThemeData(
          fontFamily: GoogleFonts.poppins().fontFamily,
          brightness: Brightness.dark,
          primarySwatch: Colors.grey,
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: Color.fromARGB(255, 0, 255, 21),
            selectionColor: Colors.grey,
            selectionHandleColor: Colors.red,
          ),
          inputDecorationTheme: InputDecorationTheme(
            isDense: true,
            filled: true,
            fillColor: Colors.grey,
            errorStyle: const TextStyle(fontSize: 12),
            prefixIconColor: Colors.grey[350],
            border: const OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100.0),
              borderSide: const BorderSide(
                width: 1.5,
                color: Colors.transparent,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100.0),
              borderSide: const BorderSide(
                width: 3.5,
                color: Colors.transparent,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100.0),
              borderSide: const BorderSide(
                width: 1.5,
                color: Colors.red,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100.0),
              borderSide: const BorderSide(
                width: 1.5,
                color: Colors.red,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100.0),
              borderSide: const BorderSide(
                width: 1.5,
                color: Colors.grey,
              ),
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(100)),
              ),
              backgroundColor: Color.fromRGBO(79, 243, 1, 1),
              foregroundColor: Colors.black,
            ),
          ),
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
              elevation: 0,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              side: const BorderSide(
                width: 1.5,
                color: Color.fromRGBO(79, 243, 1, 1),
              ),
              foregroundColor: Color.fromRGBO(79, 243, 1, 1),
            ),
          ),
          cardTheme: CardTheme(
            color: Colors.grey[700],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          appBarTheme: AppBarTheme(
            elevation: 0,
            color: Colors.grey[850],
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            unselectedItemColor: Colors.grey[600],
            selectedItemColor: Colors.white,
            type: BottomNavigationBarType.fixed,
          ),
        ),
        initialRoute: '/',
        smartManagement: SmartManagement.full,
        getPages: [
          GetPage(
            name: '/',
            page: () => const MainApp(),
          ),
          GetPage(
            name: '/front-screen/landing',
            page: () => const LandingView(),
            transition: Transition.fadeIn,
          ),
          GetPage(
            name: '/front-screen/intro',
            page: () => const IntroScreen(),
            transition: Transition.fadeIn,
          ),
          GetPage(
            name: '/front-screen/login',
            page: () => const LoginView(),
            transition: Transition.fadeIn,
          ),
          GetPage(
            name: '/front-screen/signup',
            page: () => const SignupView(),
            transition: Transition.fadeIn,
          ),
          GetPage(
            name: '/front-screen/notifsignup',
            page: () => const NotifSignup(),
            transition: Transition.fadeIn,
          ),
          GetPage(
            name: '/front-screen/homepage',
            page: () => const Homepage(),
            transition: Transition.noTransition,
          ),
        ]);
  }
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Future.delayed(const Duration(seconds: 3), () {
        Get.offNamed('/front-screen/intro');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashScreen(),
    );
  }
}
