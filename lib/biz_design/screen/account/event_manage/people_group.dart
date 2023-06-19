import 'package:code/biz_design/core/blocs/event_manage_bloc/event_manage_bloc.dart';
import 'package:code/biz_design/core/blocs/event_manage_bloc/event_manage_event.dart';
import 'package:code/biz_design/core/blocs/event_manage_bloc/event_manage_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/common/avatar_user.dart';

class PeopleGroup extends StatefulWidget {
  const PeopleGroup({Key? key}) : super(key: key);

  @override
  State<PeopleGroup> createState() => _PeopleGroupState();
}

class _PeopleGroupState extends State<PeopleGroup> {
  EventManageBloc eventManageBloc = EventManageBloc();
  final List _listAvatar = [
    'assets/images/biz_design/image_1.png',
    'assets/images/biz_design/image_14.png',
    'assets/images/biz_design/image_1.png',
    'assets/images/biz_design/image_14.png',
    'assets/images/biz_design/image_15.png',
    'assets/images/biz_design/image_1.png',
    'assets/images/biz_design/image_15.png',
    'assets/images/biz_design/image_14.png',
    'assets/images/biz_design/image_1.png',
    'assets/images/biz_design/image_15.png',
    'assets/images/biz_design/image_14.png',
  ];

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    eventManageBloc.add(ClickToPeopleGroupEvent());
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EventManageBloc, EventManageState>(
        bloc: eventManageBloc,
        listenWhen: (previous, current) => current is EventManageActionState,
        buildWhen: (previous, current) => current is !EventManageActionState,
        builder: (context, state){
          switch(state.runtimeType){
            case ClickToPeopleGroupState:
              return SingleChildScrollView(
                child: Container(
                  height: 485,
                  width: double.maxFinite,
                  margin: const EdgeInsets.fromLTRB(10, 26, 10, 20),
                  padding: const EdgeInsets.fromLTRB(10, 14, 10, 0),
                  color: const Color(0xffF9F9F9),
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          Text(
                            '参加者',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff060606),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 12),
                            child: Text(
                              '532人',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff060606),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        height: 350,
                        width: 400,
                        child: GridView.builder(
                            gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 8,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                            ),
                            itemCount: _listAvatar.length,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return CupertinoAlertDialog(
                                          content: const Text(
                                            'アクション完了テキストが入ります',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xff060606),
                                            ),
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text(
                                                '戻る',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xffDD4A30),
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      });
                                },
                                child: SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: AvatarUser(
                                    height: 30,
                                    width: 30,
                                    urlImage: _listAvatar[index],
                                  ),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              );
            default:
          }
          return const SizedBox();
        },
        listener: (context, state){});
  }
}
