import 'package:code/biz_design/user_screen/user_event_community_screen/user_event_community_bloc/event_community_bloc.dart';
import 'package:code/biz_design/user_screen/user_event_community_screen/user_event_community_bloc/event_community_event.dart';
import 'package:code/biz_design/user_screen/user_event_community_screen/user_event_community_bloc/event_community_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/avatar_user.dart';

class EventCommunityDetail extends StatefulWidget {
  const EventCommunityDetail({Key? key}) : super(key: key);

  @override
  State<EventCommunityDetail> createState() => _EventCommunityDetailState();
}

class _EventCommunityDetailState extends State<EventCommunityDetail> {
  final List _listAvatar = [
    'assets/images/biz_design/image_1.png',
    'assets/images/biz_design/image_1.png',
    'assets/images/biz_design/image_1.png',
    'assets/images/biz_design/image_1.png',
    'assets/images/biz_design/image_1.png',
    'assets/images/biz_design/image_1.png',
    'assets/images/biz_design/image_1.png',
  ];
  EventCommunityBloc eventCommunityBloc = EventCommunityBloc();

  @override
  void initState() {
    eventCommunityBloc.add(ClickToEventCommunityDetailEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EventCommunityBloc, EventCommunityState>(
      bloc: eventCommunityBloc,
      listenWhen: (previous, current) => current is EventCommunityActionState,
      buildWhen: (previous, current) => current is! EventCommunityActionState,
      builder: (context, state) {
        switch (state.runtimeType) {
          case ClickToEventCommunityDetailState:
            return SingleChildScrollView(
              child: Container(
                color: const Color(0xffF9F9F9),
                height: 481,
                width: 355,
                margin: const EdgeInsets.only(left: 8, right: 8),
                padding: const EdgeInsets.only(left: 9, right: 9),
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
                    Container(
                      height: 18,
                      width: 46,
                      color: const Color(0xffCE2424),
                      child: const Center(
                        child: Text(
                          'ビジネス',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: Color(0xffFFFFFF),
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      'プロジェクト名、プロジェクト名、プロジェクト名',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff060606),
                      ),
                    ),
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        AvatarUser(
                          width: 36,
                          height: 34,
                          urlImage: 'assets/images/biz_design/image_1.png',
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            '田中  武彦',
                            style: TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff060606),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 26,
                          margin: const EdgeInsets.only(top: 9),
                          width: 74,
                          decoration: BoxDecoration(
                            color: const Color(0xffFFF8F3),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Row(
                            children: [
                              Icon(
                                Icons.add_circle_sharp,
                                color: Color(0xffDD4A30),
                              ),
                              Text(
                                '参加する',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                  color: Color(0xffDD4A30),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const Row(
                      children: [
                        Text(
                          '参加者',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff060606),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 12),
                          child: Text(
                            '532人',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff060606),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 13, right: 13),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ...List.generate(_listAvatar.length, (index) {
                            return AvatarUser(
                              width: 30,
                              height: 30,
                              urlImage: _listAvatar[index],
                            );
                          }),
                          InkWell(
                            onTap: () {},
                            child: const CircleAvatar(
                              radius: 16,
                              backgroundColor: Color(0xff212862),
                              child: Center(
                                child: Icon(
                                  Icons.keyboard_double_arrow_right,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Center(
                      child: SizedBox(
                        height: 252,
                        width: 337,
                        child: Text(
                          'テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                            color: Color(0xff060606),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          default:
        }
        return const SizedBox();
      },
      listener: (context, state) {},
    );
  }
}
