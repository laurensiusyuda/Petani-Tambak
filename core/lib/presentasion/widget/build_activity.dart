import 'package:core/presentasion/widget/flexible_time.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
                ),
              ],
            ),
          ),
          Expanded(
            child: SvgPicture.asset(
              'asset/dashboard.svg',
              width: 140,
            ),
          ),
        ],
      ),
    );
  }
}
