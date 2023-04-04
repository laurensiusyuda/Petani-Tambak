import 'dart:async';
import 'package:utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:core/presentasion/pages/onboard_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const OnBoardPage()));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kMainColor,
      body: Center(
        child: Image(
          image: AssetImage('asset/Logo_Udangku.png'),
        ),
      ),
    );
  }
}
