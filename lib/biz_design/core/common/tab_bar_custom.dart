import 'package:flutter/material.dart';

class TabBarCustom extends StatefulWidget {
  const TabBarCustom({this.isBackButton, this.isSettingButton,Key? key}) : super(key: key);
  final bool ?isBackButton;
  final bool ?isSettingButton;

  @override
  State<TabBarCustom> createState() => _TabBarCustomState();
}

class _TabBarCustomState extends State<TabBarCustom> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 82,
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if(widget.isBackButton != null)
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 25,
                color: Color(0xff212862),
              ),
            ),
          const SizedBox(
            height: 34,
            width: 81,
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Image(
                image: AssetImage('assets/images/biz_design/n-Biz.png'),
              ),
            ),
          ),
          if(widget.isSettingButton != null)
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.settings_outlined,
                size: 25,
                color: Color(0xff212862),
              ),
            ),
        ],
      ),
    );
  }
}
