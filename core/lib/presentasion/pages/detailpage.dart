import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';
import 'package:utils/utils.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});
  static const routeName = '/detailpage';

  @override
  DetailPageState createState() => DetailPageState();
}

class DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      backgroundColor: kMainColor,
      appBar: AppBar(
        backgroundColor: kMainColor,
        shadowColor: kMainColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text(
          'Selamat Datang, ${user.displayName}',
          style: GoogleFonts.lato(
            textStyle: const TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          'Suhu',
                          style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: kMainColor,
                              border:
                                  Border.all(color: kGreenColor, width: 2.0),
                              boxShadow: const [
                                BoxShadow(
                                    color: kMainColor,
                                    blurRadius: 20.0,
                                    spreadRadius: 3.0)
                              ]),
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10.0),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: kSecondaryColor,
                                    boxShadow: [
                                      BoxShadow(
                                          color: kMainColor,
                                          blurRadius: 10.0,
                                          spreadRadius: 3.0)
                                    ]),
                                child: Center(
                                  child: Image.asset(
                                    'asset/thermometer.png',
                                    width: 100,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Suhu',
                                style: GoogleFonts.lato(
                                  textStyle: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Text(
                  'Hal Yang Perlu Dilakukan',
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
