import 'package:auth/auth.dart';
import 'package:core/presentasion/widget/buildindicator.dart';
import 'package:utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:auth/presentasion/bloc/auth_bloc.dart';
import 'package:auth/presentasion/bloc/auth_state.dart';
import 'package:core/presentasion/widget/build_activity.dart';
import 'package:core/presentasion/widget/salt_widget.dart';
import 'package:core/presentasion/widget/suhu_widget.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Getting the user from the FirebaseAuth Instance
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      backgroundColor: kMainColor,
      appBar: AppBar(
        backgroundColor: kMainColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              'asset/Logo.png',
              fit: BoxFit.cover,
              height: 30.0,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              'Petani Tambak',
              style: GoogleFonts.lato(
                textStyle: const TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        actions: <Widget>[
          InkWell(
              onTap: () {},
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: user.photoURL != null
                    ? Image.network(
                        "${user.photoURL}",
                        height: 50,
                        width: 50,
                      )
                    : IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.account_circle,
                          size: 30.0,
                          color: Colors.white,
                        ),
                      ),
              ))
        ],
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          // jika tidak login
          if (state is UnAuthenticated) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginPage(),
              ),
              (route) => false,
            );
          }
        },
        // Jika Sudah Login
        child: SingleChildScrollView(
          child: Container(
            margin:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Selamat Datang, ${user.displayName}',
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const BuildDashboard(),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    BuildIndicator(),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Data Hasil Monitoring',
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                ListView(
                  shrinkWrap: true,
                  controller: ScrollController(keepScrollOffset: true),
                  children: const [
                    BuildMonitoringSuhu(),
                    BuildMonitoringSalinitas(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
