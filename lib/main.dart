import 'package:core/presentasion/pages/dashboard.dart';

import 'firebase_options.dart';
import 'package:core/core.dart';
import 'package:utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:auth/presentasion/bloc/auth_bloc.dart';
import 'package:auth/data/service/authentication_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepository(),
      child: BlocProvider(
        create: (context) => AuthBloc(
          authRepository: RepositoryProvider.of<AuthRepository>(context),
        ),
        child: MaterialApp(
          home: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                const HomePage();
              }
              return MaterialApp(
                title: 'Udangku',
                theme: ThemeData().copyWith(colorScheme: kColorScheme),
                home: const Splash(),
              );
            },
          ),
        ),
      ),
    );
  }
}
