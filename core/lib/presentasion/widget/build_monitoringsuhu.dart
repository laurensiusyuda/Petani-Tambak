import 'package:utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:google_fonts/google_fonts.dart';

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
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(30),
                  child: Image.asset(
                    'asset/thermometer.png',
                  ),
                ),
              ),
              const SizedBox(
                width: 25,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Suhu',
                      style: GoogleFonts.lato(),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 14, 16, 0),
                      child: ReadMoreText(
                        'Lorem ipsum dolor sit amet',
                        trimLines: 4,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: ' ... Selengkapnya',
                        trimExpandedText: ' Tutup',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: Colors.white),
                        lessStyle:
                            TextStyle(color: Colors.white.withOpacity(0.5)),
                        moreStyle:
                            TextStyle(color: Colors.white.withOpacity(0.5)),
                        delimiter: '',
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
