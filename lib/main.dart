import 'package:ciak_live/controllers/settings_controller.dart';
import 'package:ciak_live/controllers/user_controller.dart';
import 'package:ciak_live/utils/extensions.dart';
import 'package:ciak_live/views/backscreens/activity_detail_view.dart';
import 'package:ciak_live/views/backscreens/activity_view.dart';
import 'package:ciak_live/views/backscreens/alert_view.dart';
import 'package:ciak_live/views/backscreens/chat_view.dart';
import 'package:ciak_live/views/backscreens/create_post_view.dart';
import 'package:ciak_live/views/backscreens/group_meeting_view.dart';
import 'package:ciak_live/views/backscreens/livecam_view.dart';
import 'package:ciak_live/views/backscreens/main.dart';
import 'package:ciak_live/views/backscreens/feeds_view.dart';
import 'package:ciak_live/views/backscreens/messages_view.dart';
import 'package:ciak_live/views/backscreens/profile_view.dart';
import 'package:ciak_live/views/backscreens/profileedits/edit_subscription_view.dart';
import 'package:ciak_live/views/backscreens/recipients_view.dart';
import 'package:ciak_live/views/backscreens/users_note_view.dart';
import 'package:ciak_live/views/backscreens/users_view.dart';
import 'package:ciak_live/views/backscreens/wallet_view.dart';
import 'package:ciak_live/views/frontscreens/landing_view.dart';
import 'package:ciak_live/views/frontscreens/login_view.dart';
import 'package:ciak_live/views/frontscreens/referral_view.dart';
import 'package:ciak_live/views/frontscreens/registered_wall_view.dart';
import 'package:ciak_live/views/frontscreens/signup_view.dart';
import 'package:ciak_live/views/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'views/backscreens/profileedits/edit_profile_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  Get.put<SettingsController>(SettingsController(), permanent: true);
  Get.put<UserController>(UserController(), permanent: true);
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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(
      builder: (controller) {
        return GetMaterialApp(
          title: 'CIAK',
          themeMode: controller.darkMode ? ThemeMode.dark : ThemeMode.light,
          scrollBehavior: NoGlowScrollBehavior(),
          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.grey,
            textSelectionTheme: const TextSelectionThemeData(
              cursorColor: Colors.red,
              selectionColor: Colors.grey,
              selectionHandleColor: Colors.red,
            ),
            inputDecorationTheme: InputDecorationTheme(
              isDense: true,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.5.h),
              filled: true,
              fillColor: Colors.white,
              prefixIconColor: Colors.grey,
              errorStyle: const TextStyle(fontSize: 0.01),
              border: const OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: const BorderSide(
                  width: 1.5,
                  color: Colors.transparent,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: const BorderSide(
                  width: 1.5,
                  color: Colors.transparent,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: const BorderSide(
                  width: 1.5,
                  color: Colors.red,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: const BorderSide(
                  width: 1.5,
                  color: Colors.red,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
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
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
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
                  color: Colors.red,
                ),
                foregroundColor: Colors.red,
              ),
            ),
            cardTheme: CardTheme(
              color: Colors.grey[200],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            appBarTheme: const AppBarTheme(
                elevation: 0, backgroundColor: Colors.white10),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              showSelectedLabels: false,
              showUnselectedLabels: false,
              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors.black,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.grey[200],
            ),
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.grey,
            textSelectionTheme: const TextSelectionThemeData(
              cursorColor: Colors.red,
              selectionColor: Colors.grey,
              selectionHandleColor: Colors.red,
            ),
            inputDecorationTheme: InputDecorationTheme(
              isDense: true,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.5.h),
              filled: true,
              fillColor: Colors.grey,
              errorStyle: const TextStyle(fontSize: 0.01),
              prefixIconColor: Colors.grey[350],
              border: const OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: const BorderSide(
                  width: 1.5,
                  color: Colors.transparent,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: const BorderSide(
                  width: 1.5,
                  color: Colors.transparent,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: const BorderSide(
                  width: 1.5,
                  color: Colors.red,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: const BorderSide(
                  width: 1.5,
                  color: Colors.red,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
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
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
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
                  color: Colors.red,
                ),
                foregroundColor: Colors.red,
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
              name: '/front-screen/login',
              page: () => const LoginView(),
              transition: Transition.upToDown,
            ),
            GetPage(
              name: '/front-screen/signup',
              page: () => const SignupView(),
              transition: Transition.downToUp,
            ),
            GetPage(
              name: '/front-screen/referral',
              page: () => const ReferralView(),
              transition: Transition.fadeIn,
            ),
            GetPage(
              name: '/front-screen/registered-wall',
              page: () => const RegisteredWallView(),
              transition: Transition.fadeIn,
            ),
            GetPage(
              name: '/back-screen/',
              page: () => const BackScreenMain(),
              transition: Transition.fadeIn,
            ),
            GetPage(
              name: '/back-screen/feeds',
              page: () => const FeedsView(),
              transition: Transition.fadeIn,
            ),
            GetPage(
              name: '/back-screen/activity',
              page: () => const ActivityView(),
              transition: Transition.fadeIn,
            ),
            GetPage(
              name: '/back-screen/activity/detail',
              page: () => const ActivityDetailView(),
              transition: Transition.rightToLeft,
            ),
            GetPage(
              name: '/back-screen/wallet',
              page: () => const WalletView(),
              transition: Transition.fadeIn,
            ),
            GetPage(
              name: '/back-screen/profile',
              page: () => const ProfileView(),
              transition: Transition.fadeIn,
            ),
            GetPage(
              name: '/back-screen/users-profile',
              page: () => const UsersView(),
              transition: Transition.fadeIn,
            ),
            GetPage(
              name: '/back-screen/create-post',
              page: () => const CreatePostView(),
              transition: Transition.downToUp,
            ),
            GetPage(
              name: '/back-screen/profile/edit-subscriptipn',
              page: () => const EditSubscriptionView(),
              transition: Transition.fadeIn,
            ),
            GetPage(
              name: '/back-screen/profile/edit-profile',
              page: () => const EditProfileView(),
              transition: Transition.fadeIn,
            ),
            GetPage(
              name: '/back-screen/alerts',
              page: () => const AlertView(),
              transition: Transition.upToDown,
            ),
            GetPage(
              name: '/back-screen/messages',
              page: () => const MessagesView(),
              transition: Transition.upToDown,
            ),
            GetPage(
              name: '/back-screen/send-note',
              page: () => const UsersNoteView(),
              transition: Transition.downToUp,
            ),
            GetPage(
              name: '/back-screen/group-meeting',
              page: () => const GroupMeetingView(),
              transition: Transition.downToUp,
            ),
            GetPage(
              name: '/back-screen/live-cam',
              page: () => const LiveCamView(),
              transition: Transition.downToUp,
            ),
            GetPage(
              name: '/back-screen/recipient',
              page: () => const RecipientsView(),
              transition: Transition.downToUp,
            ),
            GetPage(
              name: '/back-screen/chat',
              page: () => const ChatView(),
              transition: Transition.downToUp,
            ),
          ],
        );
      },
    );
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
        Get.offNamed('/front-screen/landing');
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
