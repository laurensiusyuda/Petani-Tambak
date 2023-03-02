import 'package:utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:core/presentasion/pages/onboard_page.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset(
        'asset/Logo_OnBoard.png',
      ),
      backgroundColor: kMainColor,
      showLoader: true,
      loadingText: Text(
        "Harap Tunggu",
        style: GoogleFonts.lato(
          textStyle: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      navigator: const OnBoard(),
      durationInSeconds: 5,
      loaderColor: Colors.white,
    );
  }
}
