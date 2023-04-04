import 'package:core/helper/datetimehelper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
