import 'package:code/week2/home_week2.dart';
import 'package:flutter/material.dart';

class LoginWeek2 extends StatefulWidget {
  const LoginWeek2({super.key});

  @override
  State<LoginWeek2> createState() => _LoginWeek2State();
}

class _LoginWeek2State extends State<LoginWeek2> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() {
        WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 25),
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                      margin: const EdgeInsets.only(top: 75),
                      width: 190,
                      height: 20,
                      child: const FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          'Welcome back!',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                            fontFamily: 'Plus_Jakarta_Sans',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                  ),
                  Container(
                    height: 22,
                    width: 215,
                    margin: const EdgeInsets.only(top: 10),
                    child: const FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        'Enter your creditional to continue!',
                        style: TextStyle(
                          fontSize: 14,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffB4B4B4),
                          fontFamily: 'Plus_Jakarta_Sans',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Container(
                        height: 135,
                        width: 309,
                        color: const Color(0xffC4C4C4),
                        margin: const EdgeInsets.only(top: 16.33),
                      ),
                      const Positioned(
                        top: 85.97,
                        child: SizedBox(
                          width: 80,
                          height: 20,
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              'IMAGE',
                              style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  color: Color(0xff000000),
                                  fontFamily: 'Roboto'),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                      height: 54,
                      width: 309,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: const Color(0xffB4B4B4),
                        ),
                      ),
                      margin: const EdgeInsets.only(top: 28),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Stack(
                            children: <Widget>[
                              Container(
                                height: 30,
                                width: 30,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                ),
                                margin: const EdgeInsets.only(left: 18),
                                child: const ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  child: Image(
                                    image: AssetImage(
                                        'assets/images/week2/unitedStates1.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 12,
                            height: 3,
                            margin: const EdgeInsets.only(left: 7),
                            child: const FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: Color(0xff130F26),
                              ),
                            ),
                          ),
                          Container(
                            height: 30.5,
                            width: 0.5,
                            color: const Color(0xffE2E2E2),
                            margin: const EdgeInsets.only(left: 9.5),
                          ),
                          Container(
                            height: 16,
                            width: 113,
                            margin: const EdgeInsets.only(left: 17.5),
                            child: const FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                '+01-202-555-0102',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                  fontFamily: 'Plus_Jakarta_Sans',
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 19,
                            width: 19,
                            margin: const EdgeInsets.only(left: 62),
                            child: const FittedBox(
                              fit: BoxFit.contain,
                              child: Icon(
                                Icons.check_circle,
                                color: Color(0xff49E46B),
                              ),
                            ),
                          ),
                        ],
                      ),
                  ),
                  Container(
                    height: 22,
                    width: 175,
                    margin: const EdgeInsets.only(right: 100),
                    child: const FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        'Invalid phone number or password',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            color: Color(0xffF80000),
                            fontFamily: 'Poppins',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Container(
                    height: 54,
                    width: 309,
                    margin: const EdgeInsets.only(top: 20),
                    child: TextField(
                      obscureText: true,
                      textAlignVertical: TextAlignVertical.center,
                      style:  const TextStyle(
                        color: Color(0xff1D1D1D),
                        fontSize: 31,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        overflow: TextOverflow.visible,
                      ),
                      maxLines: 1,
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            color: Color(0xffFECC2A),
                            fontFamily: 'Roboto'),
                        suffixIcon: const Icon(
                          Icons.remove_red_eye_rounded,
                          color: Color(0xff130F26),
                          size: 20,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                            color: Color(0xffFECC2A),
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                            color: Color(0xffFECC2A),
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 15,
                    width: 144,
                    margin: const EdgeInsets.only(top: 8, left: 165),
                    child: const FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        'Forgot your password?',
                        style: TextStyle(
                            fontSize: 10,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff000000),
                            fontFamily: 'Poppins'),
                      ),
                    ),
                  ),
                  Container(
                    height: 54.47,
                    width: 309,
                    margin: const EdgeInsets.only(top: 39.53),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const HomeWeek2()));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffFECC2A),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          )),
                      child: const Text(
                        'Sign in',
                        style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff1B1C1C),
                            fontFamily: 'Plus_Jakarta_Sans',
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 22,
                    width: 203,
                    margin: const EdgeInsets.only(top: 158),
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Row(
                        children: const <Widget>[
                          Text(
                            'Don’t have an account? ',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                color: Color(0xff000000),
                                fontFamily: 'Poppins'),
                          ),
                          Text(
                            'Sign up',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                color: Color(0xffFECC2A),
                                fontFamily: 'Plus_Jakarta_Sans'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
