import 'package:flutter/material.dart';

import 'bloc/exp_screen_bloc.dart';
import 'bloc/exp_screen_event.dart';

class TextToLogin2 extends StatefulWidget {
  const TextToLogin2({Key? key}) : super(key: key);

  @override
  State<TextToLogin2> createState() => _TextToLogin2State();
}

class _TextToLogin2State extends State<TextToLogin2> {
  final ExpScreenBloc expScreenBloc = ExpScreenBloc();
  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.only(top: 700,),
      child: Center(
        child: InkWell(
          onTap: () {
            expScreenBloc.add(ExpScreenNavigateLogin2Event());
          },
          child: const Text(
            'ログイン',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
        ),
      ),);
  }
}
