import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:utils/utils.dart';

class BuildMonitoringSuhu extends StatelessWidget {
  const BuildMonitoringSuhu({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, 'routeName');
      },
      child: Card(
        color: kSecondaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: kMainColor,
                  border: Border.all(color: kGreenColor, width: 2.0),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: kSecondaryColor,
                          boxShadow: [
                            BoxShadow(
                                color: kSecondaryColor,
                                blurRadius: 10.0,
                                spreadRadius: 3.0)
                          ]),
                      child: Image.asset(
                        'asset/thermometer.png',
                        width: 50,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
