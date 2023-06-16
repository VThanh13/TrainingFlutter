import 'package:code/biz_design/core/blocs/event_manage_bloc/event_manage_bloc.dart';
import 'package:code/biz_design/core/blocs/event_manage_bloc/event_manage_event.dart';
import 'package:code/biz_design/core/blocs/event_manage_bloc/event_manage_state.dart';
import 'package:code/biz_design/screen/account/event_manage/create_group.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/common/avatar_user.dart';
import 'choose_category.dart';

class EventManage extends StatefulWidget {
  const EventManage({Key? key}) : super(key: key);

  @override
  State<EventManage> createState() => _EventManageState();
}

class _EventManageState extends State<EventManage> with SingleTickerProviderStateMixin {
  EventManageBloc eventManageBloc = EventManageBloc();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    eventManageBloc.add(EventManageInitialEvent());
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EventManageBloc, EventManageState>(
        bloc: eventManageBloc,
        listenWhen: (previous, current) => current is EventManageActionState,
        buildWhen: (previous, current) => current is !EventManageActionState,
        builder: (context, state){
          switch(state.runtimeType){
            case EventManageInitialState:
              return SizedBox(
                height: 500,
                width: double.maxFinite,
                child: Column(
                  children: [
                    Container(
                      height: 30,
                      width: double.maxFinite,
                      margin: const EdgeInsets.fromLTRB(15, 15, 15, 10),
                      child: TabBar(
                        controller: _tabController,
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color(0xffDD4A30),
                        ),
                        labelColor: const Color(0xffFFF8F3),
                        unselectedLabelColor: const Color(0xff060606),
                        tabs: const [
                          Tab(
                            child: Text('主催グループ',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 10
                            ),),
                          ),
                          Tab(
                            child: Text('参加グループ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10
                              ),),
                          ),
                        ],
                      ),
                    ),
                    Expanded(child: TabBarView(
                      controller: _tabController,
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    onPressed: (){
                                      eventManageBloc.add(ClickToCreateGroupEvent());
                                    },
                                      icon: const Icon(Icons.add_circle,
                                      size: 20,),),
                                  const Text('グループを作成',style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff060606),
                                  ),),
                                  IconButton(onPressed: (){
                                    eventManageBloc.add(ClickToChooseCateEvent());
                                  },
                                      icon: const Icon(
                                        Icons.margin_outlined, size: 20,
                                      ),),
                                  const Text('カテゴリーから選択',style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff060606),
                                  ),),
                                  const SizedBox(width: 10,),
                                ],
                              ),
                              const Divider(
                                height: 0,
                                color: Color(0xff000000),
                                indent: 0,
                                thickness: 1,
                              ),
                              SizedBox(
                                width: double.maxFinite,
                                height: MediaQuery.of(context).size.height - 443,
                                child: ListView.builder(
                                    itemCount: 10,
                                    itemBuilder: (context, index){
                                      return Container(
                                        width: double.maxFinite,
                                        padding: const EdgeInsets.fromLTRB(15, 10, 0, 10),
                                        color: index % 2 == 0
                                            ? const Color(0xffFAFAFA)
                                            : const Color(0xffE5E5E5),
                                        child: InkWell(
                                          onTap: (){},
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: [
                                                  const Row(
                                                    children: [
                                                      Text(
                                                        '2020.00.00（月）',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.w400,
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                      AvatarUser(
                                                        width: 36,
                                                        height: 34,
                                                        urlImage:
                                                        'assets/images/biz_design/image_1.png',
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.only(left: 5),
                                                        child: Text(
                                                          '田中  武彦',
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight: FontWeight.w600,
                                                            color: Color(0xff060606),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  IconButton(
                                                    onPressed: () {
                                                    },
                                                    icon: const Icon(
                                                      Icons.more_horiz,
                                                      size: 25,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                height: 12,
                                                  width: 46,
                                                color: const Color(0xffE56565),
                                                child: const Center(
                                                  child: Text('ビジネス',
                                                  style: TextStyle(
                                                    fontSize: 7,
                                                    fontWeight: FontWeight.w700,
                                                    color: Color(0xffFFFFFF),
                                                  ),),
                                                ),
                                              ),
                                              const Text(
                                                'イベント・コミュニティタイトルが入ります、イベント・コミュニティタイトルが入ります',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14,
                                                  color: Color(0xff060606),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 200,
                          width: double.maxFinite,
                          child: Text('2'),
                        ),
                      ],
                    ),),
                  ],
                ),
              );
            case ClickToCreateGroupState:
              return const CreateGroupEvent();
            case ClickToChooseCateState:
              return const ChooseCateEvent();
            default:
          }
          return const SizedBox();
        },
        listener: (context, state){});
  }
}
