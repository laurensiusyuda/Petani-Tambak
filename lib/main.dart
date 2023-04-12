import 'package:auth/auth.dart';
import 'package:core/presentasion/pages/detailpage.dart';
import 'package:core/presentasion/pages/profilepage.dart';
import 'firebase_options.dart';
import 'package:core/core.dart';
import 'package:utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

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
      navigatorObservers: [routeObserver],
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/home':
            return MaterialPageRoute(builder: (_) => const Dashboard());
          case DetailPage.routeName:
            return MaterialPageRoute(builder: (_) => const DetailPage());
          case ProfilePage.routeName:
            return MaterialPageRoute(builder: (_) => const ProfilePage());
          case LoginPage.routeName:
            return MaterialPageRoute(builder: (_) => const LoginPage());
          case SignInPage.routeName:
            return MaterialPageRoute(builder: (_) => const SignInPage());
          default:
            return MaterialPageRoute(
              builder: (_) {
                return const Scaffold(
                  body: Center(
                    child: Text('Page not Found'),
                  ),
                );
              },
            );
        }
      },
    );
  }
}
