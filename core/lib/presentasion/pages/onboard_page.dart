import 'package:auth/auth.dart';
import 'package:auth/presentasion/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:utils/utils.dart';

class OnBoard extends StatefulWidget {
  const OnBoard({super.key});

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  void _onButtonEnd(context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const SignInPage()),
    );
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('asset/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    final bodyStyle = GoogleFonts.lato(
        textStyle: const TextStyle(fontSize: 19.0, color: Colors.white));
    final pageDecoration = PageDecoration(
      titleTextStyle: GoogleFonts.lato(
          textStyle: const TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.w700,
              color: Colors.white)),
      bodyTextStyle: bodyStyle,
      bodyPadding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: kMainColor,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      allowImplicitScrolling: true,
      autoScrollDuration: 3000,
      // membuat global header
      globalHeader: Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, right: 16),
            child: _buildImage('Logo_OnBoard.png', 100),
          ),
        ),
      ),

      // membuat global footer
      globalFooter: SizedBox(
        width: double.infinity,
        height: 70,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: kButtonColor,
          ),
          child: Text(
            'Dafar Akun',
            style: GoogleFonts.lato(
              textStyle: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          onPressed: () => _onButtonEnd(context),
        ),
      ),

      // membuat halaman page
      pages: [
        PageViewModel(
          title: "Selamat Datang",
          body: "Aplikasi Monitoring Kualitas Air Tambak Udang",
          image: _buildImage('Logo_OnBoard.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Selamat Datang",
          body: "Aplikasi Monitoring Kualitas Air Tambak Udang",
          image: _buildImage('Logo_OnBoard.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Selamat Datang",
          body: "Aplikasi Monitoring Kualitas Air Tambak Udang",
          image: _buildImage('Logo_OnBoard.png'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      showSkipButton: false,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: true,
      back: const Icon(
        Icons.arrow_back,
        color: Colors.white,
      ),
      next: const Icon(Icons.arrow_forward, color: Colors.white),
      done: Text(
        'Login',
        style: GoogleFonts.lato(
          textStyle:
              const TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
    );
  }
}
