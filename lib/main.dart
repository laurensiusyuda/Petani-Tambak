import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'firebase_options.dart';
import 'package:utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:core/presentasion/pages/detailpage.dart';
import 'package:core/presentasion/pages/profilepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Udangku',
      theme: ThemeData().copyWith(colorScheme: kColorScheme),
      home: const SplashScreen(),
      navigatorKey: navigatorKey,
      initialRoute: Dashboard.routeName,
      routes: {
        Dashboard.routeName: (context) => const Dashboard(),
        ProfilePage.routeName: (context) => const ProfilePage(),
        DetailPage.routeName: (context) => const DetailPage(),
        LoginPage.routeName: (context) => const LoginPage(),
        SignInPage.routeName: (context) => const SignInPage(),
      },
    );
  }
}
