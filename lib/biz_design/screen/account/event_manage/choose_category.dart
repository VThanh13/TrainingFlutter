import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/blocs/event_manage_bloc/event_manage_bloc.dart';
import '../../../core/blocs/event_manage_bloc/event_manage_event.dart';
import '../../../core/blocs/event_manage_bloc/event_manage_state.dart';
import '../../../core/common/custom_button.dart';
import '../../../core/common/tag_search_custom.dart';
import '../user_home/user_home_2/top_search_screen.dart';
import 'event_manage.dart';

class ChooseCateEvent extends StatefulWidget {
  const ChooseCateEvent({Key? key}) : super(key: key);

  @override
  State<ChooseCateEvent> createState() => _ChooseCateEventState();
}

class _ChooseCateEventState extends State<ChooseCateEvent> {
  EventManageBloc eventManageBloc = EventManageBloc();
  final List _listCategory = [];

  @override
  void initState() {
    super.initState();
    eventManageBloc.add(ClickToChooseCateEvent());
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
      },
      child: BlocConsumer(
          bloc: eventManageBloc,
          listenWhen: (previous, current) => current is EventManageActionState,
          buildWhen: (previous, current) => current is! EventManageActionState,
          builder: (context, state) {
            switch (state.runtimeType) {
              case ClickToChooseCateState:
                return SingleChildScrollView(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TagSearchCustom(textValue: 'カテゴリーを選択'),
                      SearchItem(listItem: _listCategory),
                      const SizedBox(height: 60),
                      Center(
                        child: CustomButton(
                            height: 32,
                            width: 169,
                            text: '選択したカテゴリーを表示',
                            tab: () {
                              eventManageBloc.add(EventManageInitialEvent());
                            }),
                      ),
                      const SizedBox(height: 80),
                    ],
                  ),
                );
              case EventManageInitialState:
                return const EventManage();
              default:
            }
            return const SizedBox();
          },
          listener: (context, state) {}),
    );
  }
}
