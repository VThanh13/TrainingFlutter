import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/blocs/event_community_bloc/event_community_bloc.dart';
import '../../../core/blocs/event_community_bloc/event_community_event.dart';
import '../../../core/blocs/event_community_bloc/event_community_state.dart';
import '../../../core/common/avatar_user.dart';
import 'event_community_detail.dart';

class UserEventCommunityScreen extends StatefulWidget {
  const UserEventCommunityScreen({Key? key}) : super(key: key);

  @override
  State<UserEventCommunityScreen> createState() =>
      _UserEventCommunityScreenState();
}

class _UserEventCommunityScreenState extends State<UserEventCommunityScreen> {
  final EventCommunityBloc eventCommunityBloc = EventCommunityBloc();
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
    eventCommunityBloc.add(EventCommunityInitialEvent());
    super.initState();
    _storageKey = const PageStorageKey('user_profile_scroll_position');
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EventCommunityBloc, EventCommunityState>(
      bloc: eventCommunityBloc,
      listenWhen: (previous, current) => current is EventCommunityActionState,
      buildWhen: (previous, current) => current is! EventCommunityActionState,
      builder: (context, state) {
        switch (state.runtimeType) {
          case EventCommunityInitialState:
            return Padding(
              padding: const EdgeInsets.only(
                top: 10,
              ),
              child: FutureBuilder(
                future: Future.delayed(Duration.zero),
                builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
                  if (_savedPosition != null) {
                    _scrollController.animateTo(
                      _savedPosition!,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  }
                  return ListView.builder(
                      controller: _scrollController,
                      key: _storageKey,
                      itemCount: 7,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            eventCommunityBloc
                                .add(ClickToEventCommunityDetailEvent());
                          },
                          child: Container(
                            //height: 96,
                            width: double.maxFinite,
                            padding: const EdgeInsets.fromLTRB(15, 10, 0, 10),
                            color: index % 2 != 0
                                ? const Color(0xffFAFAFA)
                                : const Color(0xffE5E5E5),
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
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
                                          fontSize: 8,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff060606),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                TagInfo(
                                  text: '趣味/音楽',
                                ),
                                Text(
                                  'イベント・コミュニティタイトルが入ります、イベント・コミュニ'
                                  '\nティタイトルが入ります',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    color: Color(0xff060606),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                },
              ),
            );
          case ClickToEventCommunityDetailState:
            return const EventCommunityDetail();
          default:
        }
        return const SizedBox();
      },
      listener: (context, state) {},
    );
  }
}

class TagInfo extends StatelessWidget {
  const TagInfo({required this.text, Key? key}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12,
      width: 46,
      color: text == 'ビジネス'
          ? const Color(0xffCE2424)
          : text == '趣味/音楽'
              ? const Color(0xff5A8E5C)
              : const Color(0xff454890),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 7,
            fontWeight: FontWeight.w700,
            color: Color(0xffFFFFFF),
          ),
        ),
      ),
    );
  }
}
