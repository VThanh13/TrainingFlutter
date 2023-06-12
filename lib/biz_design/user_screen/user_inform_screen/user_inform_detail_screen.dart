import 'package:flutter/material.dart';

class UserInformDetail extends StatefulWidget {
  const UserInformDetail({Key? key}) : super(key: key);

  @override
  State<UserInformDetail> createState() => _UserInformDetailState();
}

class _UserInformDetailState extends State<UserInformDetail> {

  late final ScrollController _scrollController;
  late final PageStorageKey _storageKey;
  double? _savedPosition;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _storageKey = const PageStorageKey('user_profile_scroll_position');
    _scrollController = ScrollController();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 26),
      child: FutureBuilder(
        future: Future.delayed(Duration.zero),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot){
          if(_savedPosition != null){
            _scrollController.animateTo(_savedPosition!,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,);
          }return ListView.builder(
            controller: _scrollController,
            key: _storageKey,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                height: 320,
                width: 355,
                color: const Color(0xffF9F9F9),
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                margin: const EdgeInsets.only(
                  left: 6,
                  right: 6,
                  bottom: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          '2020.00.00（月）',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Color(0xff333333),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.more_horiz,
                            size: 30,
                            color: Color(0xff060606),
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text(
                        '告知タイトルが入ります、告知タイトルが入ります',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff060606),
                        ),
                      ),
                    ),
                    const Center(
                      child: SizedBox(
                        height: 134,
                        width: 334,
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Image(
                            image: AssetImage(
                                'assets/images/biz_design/Rectangle_28.png'),
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 12,
                      ),
                      child: Text(
                        '告知テキストがはいります、告知テキストがはいります、告知テキストがはいります、告知テキストがはいります、告知テキストがはいります、告知テキストがはいります、告知テキストがはいります、告知テキストがはいります、告知テキストがはいります、告知テキストがはいります、告知テキストがはいります、告知テキストがはいります、告知テキストがはいります、告知テキストがはいります、告知テキストがはいります、告知テキストがはいります、告知テキストがはいります、告知テキストがはいります、',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                          color: Color(0xff333333),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
