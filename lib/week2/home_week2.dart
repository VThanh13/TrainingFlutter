import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'custom_icons.dart';
import 'material/home_title.dart';
import 'material/row_icon_text.dart';
import 'material/row_with_3part.dart';
import 'material/user_avatar.dart';

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

  var iconList = [
    Icons.car_crash_outlined,
    CustomIcons.magnifier,
    CustomIcons.commentingO,
    Icons.person_outline,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        //height: MediaQuery.of(context).size.height,
        height: 1160,
        child: Padding(
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
                    const UserAvatar(),
                    const Positioned(
                      right: 0,
                      top: 32.47,
                      child: SizedBox(
                        height: 24,
                        width: 24,
                        child: Icon(
                          Icons.add_circle_sharp,
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
                      borderRadius: BorderRadius.circular(14.0),
                      color: const Color(0xffFECC2A),
                    ),
                    labelColor: const Color(0xffFFFFFF),
                    unselectedLabelColor: const Color(0xff757575),
                    tabs: const [
                      // first tab [you can add an icon using the icon property]
                      Tab(
                        child: Text(
                          'Detail',
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
                        child: Text(
                          'Account',
                          style: TextStyle(
                            fontSize: 14,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Plus_Jakarta_Sans',
                          ),
                          textAlign: TextAlign.center,
                        ),
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
                        margin:
                            const EdgeInsets.fromLTRB(39.43, 35.47, 41.57, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const HomeTitle(
                              textValue: 'About you',
                              conWidth: 69,
                            ),
                            SizedBox(
                              height: 60,
                              child: Container(
                                margin: const EdgeInsets.only(top: 16),
                                child: const Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 86,
                                          height: 22,
                                          child: FittedBox(
                                            fit: BoxFit.fitWidth,
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
                                        ),
                                        SizedBox(
                                          width: 6,
                                          height: 10,
                                          child: FittedBox(
                                            fit: BoxFit.fitHeight,
                                            child: Icon(
                                              Icons.arrow_forward_ios,
                                              color: Color(0xffB4B4B4),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      height: 0,
                                      color: Color(0xffAAAAAA),
                                      indent: 0,
                                      thickness: 1,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const HomeTitle(
                              textValue: 'Verification',
                              conWidth: 75,
                            ),
                            const RowWith3Part(
                              textValue: 'Verify my ID',
                              conWidth: 77,
                              iconValue: CustomIcons.vcard,
                            ),
                            const RowWith3Part(
                              textValue: 'Add my phone',
                              conWidth: 94,
                              iconValue: Icons.phone_android_rounded,
                            ),
                            const RowWith3Part(
                              textValue: 'Add my e-mail',
                              conWidth: 94,
                              iconValue: CustomIcons.at,
                            ),
                          ],
                        ),
                      ),
                      // second tab bar view widget
                      SingleChildScrollView(
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(19, 24.47, 20, 23),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const HomeTitle(
                                textValue: 'Past ratings',
                                conWidth: 86,
                              ),
                              const RowIcText(
                                textValue: 'Ratings left',
                                iconValue: Icons.star_sharp,
                                iconColor: Color(0xffFECC2A),
                                conWidth: 72,
                              ),
                              const HomeTitle(
                                textValue: 'Preferences',
                                conWidth: 85,
                              ),
                              const RowWith3Part(
                                  textValue: 'Notification & Communication',
                                  conWidth: 194,
                                  iconValue: Icons.notifications_none_rounded),
                              const RowWith3Part(
                                textValue: 'Change password',
                                conWidth: 117,
                                iconValue: Icons.key_sharp,
                              ),
                              const RowWith3Part(
                                textValue: 'Postal address',
                                conWidth: 94,
                                iconValue: Icons.markunread_mailbox_outlined,
                              ),
                              const HomeTitle(
                                textValue: 'Money',
                                conWidth: 48,
                              ),
                              const RowWith3Part(
                                textValue: 'e - Wallet',
                                conWidth: 61,
                                iconValue: Icons.wallet,
                              ),
                              const RowWith3Part(
                                textValue: 'Expected payments',
                                conWidth: 130,
                                iconValue: Icons.key_sharp,
                              ),
                              const RowWith3Part(
                                textValue: 'Cards',
                                conWidth: 39,
                                iconValue: Icons.credit_card,
                              ),
                              const HomeTitle(
                                textValue: 'About',
                                conWidth: 44,
                              ),
                              const RowWith3Part(
                                textValue: 'Help',
                                conWidth: 31,
                                iconValue: Icons.headset_mic_outlined,
                              ),
                              const RowWith3Part(
                                textValue: 'Terms & Conditions',
                                conWidth: 126,
                                iconValue: Icons.featured_play_list_outlined,
                              ),
                              const RowWith3Part(
                                textValue: 'Privacy Policy',
                                conWidth: 88,
                                iconValue: Icons.key_rounded,
                              ),
                              const RowWith3Part(
                                textValue: 'Licenses',
                                conWidth: 55,
                                iconValue: CustomIcons.moneyBillWave,
                              ),
                              SizedBox(
                                height: 60,
                                child: InkWell(
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        left: 16, top: 16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            const SizedBox(
                                              width: 20,
                                              height: 20,
                                              child: FittedBox(
                                                fit: BoxFit.fitWidth,
                                                child: Icon(
                                                  Icons.logout_rounded,
                                                  color: Color(0xff757575),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 53,
                                              height: 22,
                                              margin: const EdgeInsets.only(
                                                  left: 18.99),
                                              child: const FittedBox(
                                                fit: BoxFit.fitWidth,
                                                child: Text(
                                                  'Log Out',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily:
                                                        'Plus_Jakarta_Sans',
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
                                  onTap: () => Navigator.pop(context),
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
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xffFECC2A),
        onPressed: () {},
        elevation: 0,
        child: const Icon(
          Icons.add,
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
        gapWidth: 100,
        activeIndex: 0,
        onTap: (index) {},
      ),
    );
  }
}
