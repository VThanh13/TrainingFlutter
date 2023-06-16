import 'package:code/biz_design/core/blocs/event_manage_bloc/event_manage_bloc.dart';
import 'package:code/biz_design/core/blocs/event_manage_bloc/event_manage_event.dart';
import 'package:code/biz_design/core/blocs/event_manage_bloc/event_manage_state.dart';
import 'package:code/biz_design/core/common/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/common/avatar_user.dart';

class CreateGroupEvent extends StatefulWidget {
  const CreateGroupEvent({Key? key}) : super(key: key);

  @override
  State<CreateGroupEvent> createState() => _CreateGroupEventState();
}

class _CreateGroupEventState extends State<CreateGroupEvent> {
  EventManageBloc eventManageBloc = EventManageBloc();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  bool validateTitle = false;
  bool validateContent = false;
  bool isSelected1 = false;
  bool isSelected2 = false;
  bool isSelected3 = false;
  bool showValue = false;


  @override
  void initState() {
    super.initState();
    eventManageBloc.add(ClickToCreateGroupEvent());
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
      },
      child: BlocConsumer(
          bloc: eventManageBloc,
          listenWhen: (previous, current) => current is EventManageActionState,
          buildWhen: (previous, current) => current is !EventManageActionState,
          builder: (context, state){
            switch(state.runtimeType){
              case ClickToCreateGroupState:
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(onPressed: (){},
                            icon: const Icon(Icons.cancel_outlined,
                              size: 25,),),
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: CustomButton(width:82, height:25,text: '投稿する', tab: (){}),
                          ),

                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          const AvatarUser(
                            width: 30,
                            height: 30,
                            urlImage: 'assets/images/biz_design/image_1.png',
                          ),
                          Container(
                            width: 1,
                            height: 30,
                            color: const Color(0xffDD4A30),
                            margin: const EdgeInsets.only(left: 5, right: 10),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 80,
                            child: TextField(
                              controller: _titleController,
                              decoration: InputDecoration(
                                hintText: 'タイトルを入力してください',
                                hintStyle: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                ),
                                errorText: validateTitle
                                    ? 'Title can\'t be null'
                                    : null,
                                border: const UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width - 30,
                          height: 200,
                          child: TextField(
                            maxLines: 10,
                            minLines: 1,
                            controller: _contentController,
                            decoration: InputDecoration(
                              hintText: '本文を入力してください',
                              hintStyle: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                              ),
                              errorText: validateContent
                                  ? 'Content can\'t be null'
                                  : null,
                              border: const UnderlineInputBorder(
                                  borderSide: BorderSide.none),
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        height: 0,
                        color: Color(0xffDD4A30),
                        indent: 0,
                        thickness: 1,
                      ),
                      const Padding(padding: EdgeInsets.only(left: 15, top: 16),
                      child: Text('カテゴリーを選択',style: TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w400,
                      ),),),
                      Row(
                        children: [
                          InkWell(
                            onTap: (){
                              if(isSelected1 == false){
                                setState(() {
                                  isSelected1 = true;
                                });
                              }else{
                                setState(() {
                                  isSelected1 = false;
                                });
                              }
                            },
                            child: Container(
                              height: 30,
                              width: 79,
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: const Color(0xff4D4AD6),
                                border: Border.all(
                                  width: 1,
                                  color: isSelected1 == false? const Color(0xff4D4AD6) : const Color(0xffDD4A30),
                                ),
                              ),
                              child: const Center(
                                child: Text('ビジネス',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xffFFFFFF),
                                ),),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              if(isSelected2 == false){
                                setState(() {
                                  isSelected2 = true;
                                });
                              }else{
                                setState(() {
                                  isSelected2 = false;
                                });
                              }
                            },
                            child: Container(
                              height: 30,
                              width: 79,
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: const Color(0xff4D4AD6),
                                border: Border.all(
                                  width: 1,
                                  color: isSelected2 == false? const Color(0xff4D4AD6) : const Color(0xffDD4A30),
                                ),
                              ),
                              child: const Center(
                                child: Text('趣味/音楽',
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xffFFFFFF),
                                  ),),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              if(isSelected3 == false){
                                setState(() {
                                  isSelected3 = true;
                                });
                              }else{
                                setState(() {
                                  isSelected3 = false;
                                });
                              }
                            },
                            child: Container(
                              height: 30,
                              width: 105,
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: const Color(0xff4D4AD6),
                                border: Border.all(
                                  width: 1,
                                  color: isSelected3 == false? const Color(0xff4D4AD6) : const Color(0xffDD4A30),
                                ),
                              ),
                              child: const Center(
                                child: Text('趣味/スポーツ',
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xffFFFFFF),
                                  ),),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(value: showValue,
                              onChanged: (bool? value){
                            setState(() {
                              showValue = value!;
                            });
                              }
                          ),
                          const Text('シークレットグループに設定する（参加ユーザー以外閲覧できません）',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                          ),)
                        ],
                      ),
                      const SizedBox(height: 50,),
                    ],
                  ),
                );
              default:
            }
            return const SizedBox();
          },
          listener: (context, state){}),
    );
  }
}
