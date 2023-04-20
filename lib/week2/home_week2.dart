import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:code/week2/custom_icons.dart';
import 'package:flutter/material.dart';

class HomeWeek2 extends StatefulWidget {
  const HomeWeek2({super.key});

  @override
  State<HomeWeek2> createState() => _HomeWeek2State();
}

class _HomeWeek2State extends State<HomeWeek2>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
  var iconList = [ Icons.car_crash_outlined, CustomIcons.magnifier, CustomIcons.commentingO, Icons.person_outline,];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Center(
          child: Column(
            children: [
              Stack(
                children: <Widget>[
                  Container(
                    width: 80,
                    height: 74,
                    margin: const EdgeInsets.only(top: 32.47),
                  ),
                  Container(
                    width: 73,
                    height: 74,
                    margin: const EdgeInsets.only(top: 32.47),
                    child: const ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      child: Image(
                        image: AssetImage('assets/images/week2/image1.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Positioned(
                    right: 0,
                    top: 32.47,
                    child: SizedBox(
                      height: 24,
                      width: 24,
                      child: Icon(Icons.add_circle_sharp,
                        color: Color(0xffFECC2A),
                        size: 25,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 26,
                width: 101,
                margin: const EdgeInsets.only(top: 14),
                child: const FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    'Patrick John',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      fontFamily: 'Plus_Jakarta_Sans',
                      color: Color(0xff000000),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Container(
                height: 22,
                width: 62,
                margin: const EdgeInsets.only(top: 1),
                child: const FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    'New User',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontFamily: 'Plus_Jakarta_Sans',
                        color: Color(0xff757575),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Container(
                height: 46,
                width: 283,
                padding: const EdgeInsets.all(4),
                margin: const EdgeInsets.only(top: 25.53),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: TabBar(
                  controller: _tabController,
                  // give the indicator a decoration (color and border radius)
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      14.0,
                    ),
                    color: const Color(0xffFECC2A),
                  ),
                  labelColor: const Color(0xffFFFFFF),
                  unselectedLabelColor: const Color(0xff757575),
                  tabs: const [
                    // first tab [you can add an icon using the icon property]
                    Tab(
                      child: Text('Detail',
                        style: TextStyle(
                          fontSize: 14,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Plus_Jakarta_Sans',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    // second tab [you can add an icon using the icon property]
                    Tab(
                      child: Text('Account'),
                    ),
                  ],
                ),
              ),
              // give the tab bar a height [can change height to preferred height]
              // tab bar view here
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    // first tab bar view widget
                    Container(
                      height: 300,
                      margin: const EdgeInsets.fromLTRB(39.43, 35.47, 41.57, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(
                            width: 69,
                            height: 22,
                            child: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                'About you',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontStyle: FontStyle.normal,
                                    fontFamily: 'Plus_Jakarta_Sans',
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff000000)
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                              height: 60,
                              child: Container(
                                margin: const EdgeInsets.only(top: 16),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: const [
                                        SizedBox(
                                          width: 86,
                                          height: 22,
                                          child: Text(
                                            'Write mini bio',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              fontStyle: FontStyle.normal,
                                              fontFamily: 'Plus_Jakarta_Sans',
                                              color: Color(0xff000000),
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 6,
                                          height: 10,
                                          child: FittedBox(
                                            fit: BoxFit.fitHeight,
                                            child: Icon(Icons.arrow_forward_ios,
                                              color: Color(0xffB4B4B4),),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Divider(
                                      height: 0,
                                      color: Color(0xffAAAAAA),
                                      indent: 0,
                                      thickness: 1,
                                    ),
                                  ],
                                ),
                              ),
                          ),
                          Container(
                            width: 75,
                            height: 22,
                            margin: const EdgeInsets.only(top: 28.15),
                            child: const FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                'Verification',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    fontFamily: 'Plus_Jakarta_Sans',
                                    color: Color(0xff000000)
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 56,
                            child: Container(
                              margin: const EdgeInsets.only(top: 18.27),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        margin: const EdgeInsets.only(left: 13),
                                        child: Row(
                                          children: <Widget>[
                                            const SizedBox(
                                              height: 17.14,
                                              width: 17,
                                              child: FittedBox(
                                                fit: BoxFit.fitWidth,
                                                child: Icon(CustomIcons.vcard,
                                                  color: Color(0xffAAAAAA),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 22,
                                              width: 77,
                                              margin: const EdgeInsets.only(left: 20),
                                              child: const FittedBox(
                                                fit: BoxFit.fitWidth,
                                                child: Text(
                                                  'Verify my ID',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    fontStyle: FontStyle.normal,
                                                    fontFamily: 'Plus_Jakarta_Sans',
                                                    color: Color(0xff000000),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 6,
                                        height: 10,
                                        child: FittedBox(
                                          fit: BoxFit.fitHeight,
                                          child: Icon(Icons.arrow_forward_ios,
                                            color: Color(0xffB4B4B4),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  const Divider(
                                    height: 0,
                                    color: Color(0xffAAAAAA),
                                    indent: 0,
                                    thickness: 1,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 56,
                            child: Container(
                              margin: const EdgeInsets.only(top: 18.27),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        margin: const EdgeInsets.only(left: 13),
                                        child: Row(
                                          children: <Widget>[
                                            const SizedBox(
                                              height: 17.14,
                                              width: 20,
                                              child: FittedBox(
                                                fit: BoxFit.fitWidth,
                                                child: Icon(Icons.phone_android_rounded,
                                                  color: Color(0xffAAAAAA),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 22,
                                              width: 94,
                                              margin: const EdgeInsets.only(left: 17),
                                              child: const FittedBox(
                                                fit: BoxFit.fitWidth,
                                                child: Text(
                                                  'Add my phone',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    fontStyle: FontStyle.normal,
                                                    fontFamily: 'Plus_Jakarta_Sans',
                                                    color: Color(0xff000000),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 6,
                                        height: 10,
                                        child: FittedBox(
                                          fit: BoxFit.fitHeight,
                                          child: Icon(Icons.arrow_forward_ios,
                                            color: Color(0xffB4B4B4),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  const Divider(
                                    height: 0,
                                    color: Color(0xffAAAAAA),
                                    indent: 0,
                                    thickness: 1,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 56,
                            child: Container(
                              margin: const EdgeInsets.only(top: 18.27),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        margin: const EdgeInsets.only(left: 13),
                                        child: Row(
                                          children: <Widget>[
                                            const SizedBox(
                                              height: 17.14,
                                              width: 17,
                                              child: FittedBox(
                                                fit: BoxFit.fitWidth,
                                                child: Icon(CustomIcons.at,
                                                  color: Color(0xffAAAAAA),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 22,
                                              width: 94,
                                              margin: const EdgeInsets.only(left: 20),
                                              child: const FittedBox(
                                                fit: BoxFit.fitWidth,
                                                child: Text(
                                                  'Add my e-mail',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    fontStyle: FontStyle.normal,
                                                    fontFamily: 'Plus_Jakarta_Sans',
                                                    color: Color(0xff000000),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 6,
                                        height: 10,
                                        child: FittedBox(
                                          fit: BoxFit.fitHeight,
                                          child: Icon(Icons.arrow_forward_ios,
                                            color: Color(0xffB4B4B4),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  const Divider(
                                    height: 0,
                                    color: Color(0xffAAAAAA),
                                    indent: 0,
                                    thickness: 1,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // second tab bar view widget
                    Container(
                      margin: const EdgeInsets.fromLTRB(19, 24.47, 20, 5),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const SizedBox(
                              height: 22,
                              width: 86,
                              child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  'Past ratings',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                    fontFamily: 'Poppins',
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 64,
                              child: Container(
                                margin: const EdgeInsets.only(left: 3, top: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        const SizedBox(
                                          width: 20,
                                          height: 20,
                                          child: FittedBox(
                                            fit: BoxFit.fitWidth,
                                            child: Icon(Icons.star_sharp,
                                              color: Color(0xffFECC2A),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 72,
                                          height: 22,
                                          margin: const EdgeInsets.only(left: 18.99),
                                          child: const FittedBox(
                                            fit: BoxFit.fitWidth,
                                            child: Text(
                                              'Ratings left',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: 'Plus_Jakarta_Sans',
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xff000000),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    const Divider(
                                      height: 0,
                                      color: Color(0xffAAAAAA),
                                      indent: 0,
                                      thickness: 1,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 22,
                              width: 85,
                              margin: const EdgeInsets.only(top: 24),
                              child: const Text(
                                'Preferences',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.normal,
                                  fontFamily: 'Poppins',
                                  color: Color(0xff000000),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: 56,
                              child: Container(
                                margin: const EdgeInsets.only(top: 18.27),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                          margin: const EdgeInsets.only(left: 13),
                                          child: Row(
                                            children: <Widget>[
                                              const SizedBox(
                                                height: 17.14,
                                                width: 20,
                                                child: FittedBox(
                                                  fit: BoxFit.fitWidth,
                                                  child: Icon(Icons.notifications_none_rounded,
                                                    color: Color(0xff757575),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 22,
                                                width: 194,
                                                margin: const EdgeInsets.only(left: 20),
                                                child: const FittedBox(
                                                  fit: BoxFit.fitWidth,
                                                  child: Text(
                                                    'Notification & Communication ',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w400,
                                                      fontStyle: FontStyle.normal,
                                                      fontFamily: 'Plus_Jakarta_Sans',
                                                      color: Color(0xff000000),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 6,
                                          height: 10,
                                          child: FittedBox(
                                            fit: BoxFit.fitHeight,
                                            child: Icon(Icons.arrow_forward_ios,
                                              color: Color(0xffB4B4B4),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    const Divider(
                                      height: 0,
                                      color: Color(0xffAAAAAA),
                                      indent: 0,
                                      thickness: 1,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 56,
                              child: Container(
                                margin: const EdgeInsets.only(top: 18.27),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                          margin: const EdgeInsets.only(left: 13),
                                          child: Row(
                                            children: <Widget>[
                                              const SizedBox(
                                                height: 17.14,
                                                width: 20,
                                                child: FittedBox(
                                                  fit: BoxFit.fitWidth,
                                                  child: Icon(Icons.key_sharp,
                                                    color: Color(0xff757575),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 22,
                                                width: 117,
                                                margin: const EdgeInsets.only(left: 20),
                                                child: const FittedBox(
                                                  fit: BoxFit.fitWidth,
                                                  child: Text(
                                                    'Change password',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w400,
                                                      fontStyle: FontStyle.normal,
                                                      fontFamily: 'Plus_Jakarta_Sans',
                                                      color: Color(0xff000000),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 6,
                                          height: 10,
                                          child: FittedBox(
                                            fit: BoxFit.fitHeight,
                                            child: Icon(Icons.arrow_forward_ios,
                                              color: Color(0xffB4B4B4),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    const Divider(
                                      height: 0,
                                      color: Color(0xffAAAAAA),
                                      indent: 0,
                                      thickness: 1,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 56,
                              child: Container(
                                margin: const EdgeInsets.only(top: 18.27),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                          margin: const EdgeInsets.only(left: 13),
                                          child: Row(
                                            children: <Widget>[
                                              const SizedBox(
                                                height: 17.14,
                                                width: 20,
                                                child: FittedBox(
                                                  fit: BoxFit.fitWidth,
                                                  child: Icon(Icons.markunread_mailbox_outlined,
                                                    color: Color(0xff757575),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 22,
                                                width: 94,
                                                margin: const EdgeInsets.only(left: 20),
                                                child: const FittedBox(
                                                  fit: BoxFit.fitWidth,
                                                  child: Text(
                                                    'Postal address',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w400,
                                                      fontStyle: FontStyle.normal,
                                                      fontFamily: 'Plus_Jakarta_Sans',
                                                      color: Color(0xff000000),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 6,
                                          height: 10,
                                          child: FittedBox(
                                            fit: BoxFit.fitHeight,
                                            child: Icon(Icons.arrow_forward_ios,
                                              color: Color(0xffB4B4B4),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    const Divider(
                                      height: 0,
                                      color: Color(0xffAAAAAA),
                                      indent: 0,
                                      thickness: 1,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 22,
                              width: 48,
                              margin: const EdgeInsets.only(top: 24),
                              child: const Text(
                                'Money',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 56,
                              child: Container(
                                margin: const EdgeInsets.only(top: 18.27),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                          margin: const EdgeInsets.only(left: 13),
                                          child: Row(
                                            children: <Widget>[
                                              const SizedBox(
                                                height: 17.14,
                                                width: 20,
                                                child: FittedBox(
                                                  fit: BoxFit.fitWidth,
                                                  child: Icon(Icons.wallet,
                                                    color: Color(0xff757575),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 22,
                                                width: 61,
                                                margin: const EdgeInsets.only(left: 20),
                                                child: const FittedBox(
                                                  fit: BoxFit.fitWidth,
                                                  child: Text(
                                                    'e - Wallet',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w400,
                                                      fontStyle: FontStyle.normal,
                                                      fontFamily: 'Plus_Jakarta_Sans',
                                                      color: Color(0xff000000),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 6,
                                          height: 10,
                                          child: FittedBox(
                                            fit: BoxFit.fitHeight,
                                            child: Icon(Icons.arrow_forward_ios,
                                              color: Color(0xffB4B4B4),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    const Divider(
                                      height: 0,
                                      color: Color(0xffAAAAAA),
                                      indent: 0,
                                      thickness: 1,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 56,
                              child: Container(
                                margin: const EdgeInsets.only(top: 18.27),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                          margin: const EdgeInsets.only(left: 13),
                                          child: Row(
                                            children: <Widget>[
                                              const SizedBox(
                                                height: 17.14,
                                                width: 20,
                                                child: FittedBox(
                                                  fit: BoxFit.fitWidth,
                                                  child: Icon(Icons.key_sharp,
                                                    color: Color(0xff757575),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 22,
                                                width: 130,
                                                margin: const EdgeInsets.only(left: 20),
                                                child: const FittedBox(
                                                  fit: BoxFit.fitWidth,
                                                  child: Text(
                                                    'Expected payments',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w400,
                                                      fontStyle: FontStyle.normal,
                                                      fontFamily: 'Plus_Jakarta_Sans',
                                                      color: Color(0xff000000),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 6,
                                          height: 10,
                                          child: FittedBox(
                                            fit: BoxFit.fitHeight,
                                            child: Icon(Icons.arrow_forward_ios,
                                              color: Color(0xffB4B4B4),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    const Divider(
                                      height: 0,
                                      color: Color(0xffAAAAAA),
                                      indent: 0,
                                      thickness: 1,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 56,
                              child: Container(
                                margin: const EdgeInsets.only(top: 18.27),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                          margin: const EdgeInsets.only(left: 13),
                                          child: Row(
                                            children: <Widget>[
                                              const SizedBox(
                                                height: 17.14,
                                                width: 20,
                                                child: FittedBox(
                                                  fit: BoxFit.fitWidth,
                                                  child: Icon(Icons.credit_card,
                                                    color: Color(0xff757575),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 22,
                                                width: 39,
                                                margin: const EdgeInsets.only(left: 20),
                                                child: const FittedBox(
                                                  fit: BoxFit.fitWidth,
                                                  child: Text(
                                                    'Cards',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w400,
                                                      fontStyle: FontStyle.normal,
                                                      fontFamily: 'Plus_Jakarta_Sans',
                                                      color: Color(0xff000000),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 6,
                                          height: 10,
                                          child: FittedBox(
                                            fit: BoxFit.fitHeight,
                                            child: Icon(Icons.arrow_forward_ios,
                                              color: Color(0xffB4B4B4),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    const Divider(
                                      height: 0,
                                      color: Color(0xffAAAAAA),
                                      indent: 0,
                                      thickness: 1,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 22,
                              width: 44,
                              margin: const EdgeInsets.only(top: 24),
                              child: const Text(
                                'About',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.normal,
                                  fontFamily: 'Poppins',
                                  color: Color(0xff000000),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 56,
                              child: Container(
                                margin: const EdgeInsets.only(top: 18.27),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                          margin: const EdgeInsets.only(left: 13),
                                          child: Row(
                                            children: <Widget>[
                                              const SizedBox(
                                                height: 17.14,
                                                width: 20,
                                                child: FittedBox(
                                                  fit: BoxFit.fitWidth,
                                                  child: Icon(Icons.headset_mic_outlined,
                                                    color: Color(0xff757575),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 22,
                                                width: 31,
                                                margin: const EdgeInsets.only(left: 20),
                                                child: const FittedBox(
                                                  fit: BoxFit.fitWidth,
                                                  child: Text(
                                                    'Help',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w400,
                                                      fontStyle: FontStyle.normal,
                                                      fontFamily: 'Plus_Jakarta_Sans',
                                                      color: Color(0xff000000),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 6,
                                          height: 10,
                                          child: FittedBox(
                                            fit: BoxFit.fitHeight,
                                            child: Icon(Icons.arrow_forward_ios,
                                              color: Color(0xffB4B4B4),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    const Divider(
                                      height: 0,
                                      color: Color(0xffAAAAAA),
                                      indent: 0,
                                      thickness: 1,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 56,
                              child: Container(
                                margin: const EdgeInsets.only(top: 18.27),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                          margin: const EdgeInsets.only(left: 13),
                                          child: Row(
                                            children: <Widget>[
                                              const SizedBox(
                                                height: 17.14,
                                                width: 20,
                                                child: FittedBox(
                                                  fit: BoxFit.fitWidth,
                                                  child: Icon(Icons.featured_play_list_outlined,
                                                    color: Color(0xff757575),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 22,
                                                width: 126,
                                                margin: const EdgeInsets.only(left: 20),
                                                child: const FittedBox(
                                                  fit: BoxFit.fitWidth,
                                                  child: Text(
                                                    'Terms & Conditions',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w400,
                                                      fontStyle: FontStyle.normal,
                                                      fontFamily: 'Plus_Jakarta_Sans',
                                                      color: Color(0xff000000),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 6,
                                          height: 10,
                                          child: FittedBox(
                                            fit: BoxFit.fitHeight,
                                            child: Icon(Icons.arrow_forward_ios,
                                              color: Color(0xffB4B4B4),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    const Divider(
                                      height: 0,
                                      color: Color(0xffAAAAAA),
                                      indent: 0,
                                      thickness: 1,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 56,
                              child: Container(
                                margin: const EdgeInsets.only(top: 18.27),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                          margin: const EdgeInsets.only(left: 13),
                                          child: Row(
                                            children: <Widget>[
                                              const SizedBox(
                                                height: 17.14,
                                                width: 20,
                                                child: FittedBox(
                                                  fit: BoxFit.fitWidth,
                                                  child: Icon(Icons.key_rounded,
                                                    color: Color(0xff757575),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 22,
                                                width: 88,
                                                margin: const EdgeInsets.only(left: 20),
                                                child: const FittedBox(
                                                  fit: BoxFit.fitWidth,
                                                  child: Text(
                                                    'Privacy Policy',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w400,
                                                      fontStyle: FontStyle.normal,
                                                      fontFamily: 'Plus_Jakarta_Sans',
                                                      color: Color(0xff000000),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 6,
                                          height: 10,
                                          child: FittedBox(
                                            fit: BoxFit.fitHeight,
                                            child: Icon(Icons.arrow_forward_ios,
                                              color: Color(0xffB4B4B4),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    const Divider(
                                      height: 0,
                                      color: Color(0xffAAAAAA),
                                      indent: 0,
                                      thickness: 1,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 56,
                              child: Container(
                                margin: const EdgeInsets.only(top: 18.27),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                          margin: const EdgeInsets.only(left: 13),
                                          child: Row(
                                            children: <Widget>[
                                              const SizedBox(
                                                height: 17.14,
                                                width: 17,
                                                child: FittedBox(
                                                  fit: BoxFit.fitWidth,
                                                  child: Icon(CustomIcons.moneyBillWave,
                                                    color: Color(0xff757575),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 22,
                                                width: 55,
                                                margin: const EdgeInsets.only(left: 23),
                                                child: const FittedBox(
                                                  fit: BoxFit.fitWidth,
                                                  child: Text(
                                                    'Licenses',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w400,
                                                      fontStyle: FontStyle.normal,
                                                      fontFamily: 'Plus_Jakarta_Sans',
                                                      color: Color(0xff000000),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 6,
                                          height: 10,
                                          child: FittedBox(
                                            fit: BoxFit.fitHeight,
                                            child: Icon(Icons.arrow_forward_ios,
                                              color: Color(0xffB4B4B4),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    const Divider(
                                      height: 0,
                                      color: Color(0xffAAAAAA),
                                      indent: 0,
                                      thickness: 1,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 60,
                              child: Container(
                                margin: const EdgeInsets.only(left: 16, top: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        const SizedBox(
                                          width: 20,
                                          height: 20,
                                          child: FittedBox(
                                            fit: BoxFit.fitWidth,
                                            child: Icon(Icons.logout_rounded,
                                              color: Color(0xff757575),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 53,
                                          height: 22,
                                          margin: const EdgeInsets.only(left: 18.99),
                                          child: const FittedBox(
                                            fit: BoxFit.fitWidth,
                                            child: Text(
                                              'Log Out',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: 'Plus_Jakarta_Sans',
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xff000000),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xffFECC2A),
        onPressed: (){},
        elevation: 0,
        child: const Icon(Icons.add,
          color: Color(0xffFFFFFF),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        backgroundColor: const Color(0xffF5F5F5),
        inactiveColor: const Color(0xff9EA1B0),
        activeColor: const Color(0xffFECC2A),
        gapLocation: GapLocation.center,
        height: 71,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        icons: iconList,
        iconSize: 25,
        activeIndex: 0,
        onTap: (index){},
      ),
    );
  }
}