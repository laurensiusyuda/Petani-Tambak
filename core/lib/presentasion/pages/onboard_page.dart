import 'package:auth/data/service/authentication_service.dart';
import 'package:auth/presentasion/bloc/auth_bloc.dart';
import 'package:core/presentasion/pages/dashboard.dart';
import 'package:core/presentasion/widget/onboard_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardPage extends StatelessWidget {
  static const routeName = 'on-boarding';

  const OnBoardPage({super.key});

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
                return const Dashboard();
              }
              return const OnBoardingWidget();
            },
          ),
        ),
      ),
    );
  }
}
