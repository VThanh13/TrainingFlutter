import 'package:flutter/cupertino.dart';

import 'bloc/register_screen_bloc.dart';
import 'bloc/register_screen_event.dart';

class RegisterScreenListImage extends StatefulWidget {
  const RegisterScreenListImage({Key? key}) : super(key: key);

  @override
  State<RegisterScreenListImage> createState() => _RegisterScreenListImageState();
}

class _RegisterScreenListImageState extends State<RegisterScreenListImage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final ExpScreenBloc expScreenBloc = ExpScreenBloc();
  List imageUrl = [
    'assets/images/biz_design/Rectangle_5.jpg',
    'assets/images/biz_design/Rectangle_5.jpg',
    'assets/images/biz_design/Rectangle_5.jpg',
    'assets/images/biz_design/Rectangle_5.jpg',
  ];

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
    return Center(
      child: Container(
        height: 328,
        width: 283,
        margin: const EdgeInsets.only(top: 271),
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                children:  [
                  ...List.generate(imageUrl.length, (index){
                    return SizedBox(
                      width: 283,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Image(
                          image: AssetImage(imageUrl[index]),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              height: 25,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < imageUrl.length; i++)
                    AnimatedContainer(
                      duration:
                      const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 5),
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: _currentPage == i
                            ? const Color(0xffDD4A30)
                            : const Color(0xffFFFFFF),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
