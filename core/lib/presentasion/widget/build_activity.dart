import 'package:core/helper/datetimehelper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:utils/utils.dart';

class BuildDashboard extends StatefulWidget {
  const BuildDashboard({super.key});

  @override
  State<BuildDashboard> createState() => _BuildDashboardState();
}

class _BuildDashboardState extends State<BuildDashboard> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Container(
      margin: const EdgeInsets.only(top: 30),
      decoration: BoxDecoration(
        color: kSecondaryColor,
        borderRadius: BorderRadius.circular(20.0),
      ),
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          SizedBox(
            width: 180,
            height: 180,
            child: Column(
              children: [
                timeNow(),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: user.displayName != null
                      ? Text(
                          "Selamat Datang Petambak ${user.displayName}",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      : Text(
                          'Selamat Datang Petani Tambak',
                          style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                ),
                Expanded(
                  child: Text(
                    'Bagaimana kualitas air tambakmu hari ini?',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Flexible timeNow() {
  var time = DatetimeHelper.dateTimeScheduled();
  if (time.hour >= 6 && time.hour < 10) {
    return Expanded(
      child: Text(
        'Selamat Pagi',
        style: GoogleFonts.lato(
          textStyle: const TextStyle(
            fontSize: 15,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  } else if (time.hour >= 10 && time.hour < 15) {
    return Expanded(
      child: Text(
        'Selamat Siang',
        style: GoogleFonts.lato(
          textStyle: const TextStyle(
            fontSize: 15,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  } else if (time.hour >= 15 && time.hour < 18) {
    return Expanded(
      child: Text(
        'Selamat Sore ',
        style: GoogleFonts.lato(
          textStyle: const TextStyle(
            fontSize: 15,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  } else {
    return Flexible(
      child: Text(
        'Selamat Malam selamat datang diaplikasi Udangku',
        textAlign: TextAlign.center,
        style: GoogleFonts.lato(
          textStyle: const TextStyle(
            fontSize: 15,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
