import 'package:code/biz_design/common/avatar_user.dart';
import 'package:code/biz_design/user_screen/user_inform_screen/user_inform_bloc/user_inform_bloc.dart';
import 'package:code/biz_design/user_screen/user_inform_screen/user_inform_bloc/user_inform_event.dart';
import 'package:code/biz_design/user_screen/user_inform_screen/user_inform_bloc/user_inform_state.dart';
import 'package:code/biz_design/user_screen/user_inform_screen/user_inform_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserInformScreen extends StatefulWidget {
  const UserInformScreen({Key? key}) : super(key: key);

  @override
  State<UserInformScreen> createState() => _UserInformScreenState();
}

class _UserInformScreenState extends State<UserInformScreen> {
  final UserInformBloc userInformBloc = UserInformBloc();

  @override
  void initState() {
    userInformBloc.add(UserInformInitialEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserInformBloc, UserInformState>(
      bloc: userInformBloc,
      buildWhen: (previous, current) => current is !UserInformActionState,
        listenWhen: (previous, current) => current is UserInformActionState,
        builder: (context, state){
        switch(state.runtimeType){
          case UserInformInitialState:
            return Padding(
              padding: const EdgeInsets.only(
                top: 10,
              ),
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        userInformBloc.add(ClickToUserNotificationDetailEvent());
                      },
                      child: Container(
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
                            Text(
                              '告知タイトルが入ります、告知タイトルが入ります',
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
                  }),
            );
          case ClickToUserNotificationDetailState:
            return const UserInformDetail();
          default:
        }
        return const SizedBox();
        },
        listener: (context, state){},
    );
  }
}
