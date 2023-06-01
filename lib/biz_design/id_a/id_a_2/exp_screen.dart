import 'package:code/biz_design/id_a/id_a_2/bloc/exp_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../id_a_4/login2.dart';
import 'bloc/exp_screen_event.dart';
import 'bloc/exp_screen_state.dart';

class ExpScreen extends StatefulWidget {
  const ExpScreen({Key? key}) : super(key: key);

  @override
  State<ExpScreen> createState() => _ExpScreenState();
}

class _ExpScreenState extends State<ExpScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final ExpScreenBloc expScreenBloc = ExpScreenBloc();

  @override
  void initState() {
    expScreenBloc.add(ExpScreenInitialEvent());
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      body: BlocConsumer<ExpScreenBloc, ExpScreenState>(
        bloc: expScreenBloc,
        listenWhen: (previous, current) => current is ExpScreenActionState,
        buildWhen: (previous, current) => current is !ExpScreenActionState,
        listener: (context, state){
          if(state is ExpScreenNavigateLogin2State){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const Login2()));
          }
        },
        builder: (context, state){
          switch(state.runtimeType){
            case ExpScreenInitial:
              return SingleChildScrollView(
                child: Stack(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: double.maxFinite,
                    ),
                    const Positioned(
                      left: 148,
                      top: 0,
                      child: Image(
                        image: AssetImage('assets/images/biz_design/Ellipse_19.png'),
                      ),),
                    const Positioned(
                      left: 0,
                      top: 537,
                      child: Image(
                        image: AssetImage('assets/images/biz_design/Ellipse_18.png'),
                      ),
                    ),
                    const Positioned(
                      top: 126,
                      left: 80,
                      child: SizedBox(
                        height: 10,
                        width: 252,
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text('ビジネスが加速するマッチングサービス',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 158,
                      left: 94,
                      child: Container(
                        height: 80,
                        width: 189,
                        padding: const EdgeInsets.only(bottom: 18),
                        child: const FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Image(
                            image: AssetImage('assets/images/biz_design/n-Biz.png'),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        height: 328,
                        width: 283,
                        margin: const EdgeInsets.only(top: 271),
                        child: Column(
                          children: [
                            Expanded(
                              child: PageView(
                                controller: _pageController,
                                onPageChanged: (int page){
                                  setState(() {
                                    _currentPage = page;
                                  });
                                },
                                children: const [
                                  SizedBox(
                                    width: 283,
                                    child: FittedBox(
                                      fit: BoxFit.fitWidth,
                                      child: Image(
                                        image: AssetImage('assets/images/biz_design/Rectangle_5.jpg'),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 283,
                                    child: FittedBox(
                                      fit: BoxFit.fitWidth,
                                      child: Image(
                                        image: AssetImage('assets/images/biz_design/Rectangle_5.jpg'),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 283,
                                    child: FittedBox(
                                      fit: BoxFit.fitWidth,
                                      child: Image(
                                        image: AssetImage('assets/images/biz_design/Rectangle_5.jpg'),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 283,
                                    child: FittedBox(
                                      fit: BoxFit.fitWidth,
                                      child: Image(
                                        image: AssetImage('assets/images/biz_design/Rectangle_5.jpg'),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              height: 25,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  for (int i = 0; i < 4; i++)
                                    AnimatedContainer(
                                      duration: const Duration(milliseconds: 300),
                                      margin: const EdgeInsets.symmetric(horizontal: 5),
                                      width: 8,
                                      height: 8,
                                      decoration: BoxDecoration(
                                        color: _currentPage == i ? const Color(0xffDD4A30) : const Color(0xffFFFFFF),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 44,
                      top: 641,
                      child: SizedBox(
                        height: 25,
                        width: 92,
                        child: ElevatedButton(
                          onPressed: (){},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xffFF3C3C),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          ),
                          child: const Text('名刺交換する',
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            style: TextStyle(fontSize: 10, color: Color(0xffFFFFFF),
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 184,
                      top: 641,
                      child: SizedBox(
                        height: 32,
                        width: 169,
                        child: ElevatedButton(
                          onPressed: (){},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xffFF3C3C),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          ),
                          child: const Text('お問い合わせページへ',
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            style: TextStyle(fontSize: 12, color: Color(0xffFFFFFF),
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 700,
                        left: 165,
                        child: InkWell(
                          onTap: (){
                            expScreenBloc.add(ExpScreenNavigateLogin2Event());
                          },
                          child: const Text('ログイン',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16
                            ),),
                        ))
                  ],
                ),
              );
            default:
          }
          return const SizedBox();
        },
      ),
    );
  }
}
