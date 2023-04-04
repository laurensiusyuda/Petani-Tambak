import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:utils/utils.dart';

class OnBoardingPage extends StatelessWidget {
  static const routeName = 'on-boarding';

  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/Logo_OnBoard.png',
                width: 180,
                height: 180,
              ),
              Flexible(
                child: Text(
                  'Selamat Datang',
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Text(
                  'Aplikasi Monitoring Kualitas Air Tambak Udang',
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, LoginPage.routeName);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kButtonColor,
                  fixedSize: Size(MediaQuery.of(context).size.width - 100, 48),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, LoginPage.routeName);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kButtonColor,
                  fixedSize: Size(MediaQuery.of(context).size.width - 100, 48),
                ),
                child: const Text(
                  'Masuk',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
