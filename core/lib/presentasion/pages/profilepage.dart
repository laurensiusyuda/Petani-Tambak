import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:core/core.dart';
import 'package:readmore/readmore.dart';
import 'package:utils/utils.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  static const routeName = '/profile';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      appBar: AppBar(
        backgroundColor: kSecondaryColor,
        shadowColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: kSecondaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50.0),
                  bottomRight: Radius.circular(50.0),
                ),
              ),
              child: Column(
                children: [
                  const Hero(
                    tag: 'profile',
                    child: Icon(
                      Icons.account_circle_sharp,
                      color: Colors.white,
                      size: 150,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Petani Tambak',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Colors.white),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildMonitoring(),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Aktivitas',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ListView(
                    shrinkWrap: true,
                    controller: ScrollController(keepScrollOffset: true),
                    children: [
                      ListTile(
                        tileColor: kSecondaryColor,
                        contentPadding: const EdgeInsets.all(10.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        leading: Image.asset('assets/test.png'),
                        title: Row(
                          children: [
                            Text(
                              'Title',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SvgPicture.asset(
                              'assets/mark.svg',
                              width: 15,
                            ),
                            Text(
                              ' Salinitas',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      color: kYelllow2Color,
                                      fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                        subtitle: Text(
                          'Lorem Ipsum dolor sit Amet',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ListTile(
                        tileColor: kSecondaryColor,
                        contentPadding: const EdgeInsets.all(10.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        leading: Image.asset('assets/test.png'),
                        title: Row(
                          children: [
                            Text(
                              'Title',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SvgPicture.asset(
                              'assets/mark.svg',
                              width: 15,
                            ),
                            Text(
                              ' pH air',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      color: kYelllow2Color,
                                      fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                        subtitle: Text(
                          'Lorem Ipsum dolor sit Amet ',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ListTile(
                        tileColor: kSecondaryColor,
                        contentPadding: const EdgeInsets.all(10.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        leading: Image.asset('assets/test.png'),
                        title: Row(
                          children: [
                            Text(
                              'Title',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SvgPicture.asset(
                              'assets/mark.svg',
                              width: 15,
                            ),
                            Text(
                              ' pH air',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      color: kYelllow2Color,
                                      fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                        subtitle: Text(
                          'Lorem Ipsum dolor sit Amet',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox _buildMonitoring() {
    return SizedBox(
      height: 170,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        controller: ScrollController(keepScrollOffset: true),
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width - 15,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, DetailPage.routeName);
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
                        padding: const EdgeInsets.all(22.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: kMainColor,
                            border: Border.all(color: kGreenColor, width: 2.0)),
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
                                'assets/thermometer.png',
                                width: 50,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              '27\u00b0',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
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
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
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
                                lessStyle: TextStyle(
                                    color: Colors.white.withOpacity(0.5)),
                                moreStyle: TextStyle(
                                    color: Colors.white.withOpacity(0.5)),
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
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 20,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, DetailPage.routeName);
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
                        padding: const EdgeInsets.all(22.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: kMainColor,
                            border:
                                Border.all(color: kYellowColor, width: 2.0)),
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
                                'assets/salt.png',
                                width: 50,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              '27\u00b0',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
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
                              'Salinitas',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
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
                                lessStyle: TextStyle(
                                    color: Colors.white.withOpacity(0.5)),
                                moreStyle: TextStyle(
                                    color: Colors.white.withOpacity(0.5)),
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
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 20,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, DetailPage.routeName);
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
                        padding: const EdgeInsets.all(22.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: kMainColor,
                            border: Border.all(color: kRedColor, width: 2.0)),
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
                                'assets/ph.png',
                                width: 50,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              '27\u00b0',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
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
                              'pH air',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
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
                                lessStyle: TextStyle(
                                    color: Colors.white.withOpacity(0.5)),
                                moreStyle: TextStyle(
                                    color: Colors.white.withOpacity(0.5)),
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
            ),
          ),
        ],
      ),
    );
  }
}
