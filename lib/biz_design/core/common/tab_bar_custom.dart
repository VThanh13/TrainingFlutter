import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../main.dart';

class TabBarCustom extends StatefulWidget {
  const TabBarCustom({this.isBackButton, this.isSettingButton, Key? key})
      : super(key: key);
  final bool? isBackButton;
  final bool? isSettingButton;

  @override
  State<TabBarCustom> createState() => _TabBarCustomState();
}

class _TabBarCustomState extends State<TabBarCustom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 82,
      width: double.maxFinite,
      color: Theme.of(context).appBarTheme.backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (widget.isBackButton != null)
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                size: 25,
                color: Theme.of(context).appBarTheme.iconTheme!.color,
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
          if (widget.isSettingButton != null)
            IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Change theme',
                            style: Theme.of(context).textTheme.titleMedium),
                        actions: [
                          ElevatedButton(
                            onPressed: () async {
                              MyApp.themeNotifier.value =
                                  MyApp.themeNotifier.value == ThemeMode.light
                                      ? ThemeMode.dark
                                      : ThemeMode.light;
                              final prefs =
                                  await SharedPreferences.getInstance();
                              if (MyApp.themeNotifier.value ==
                                  ThemeMode.light) {
                                await prefs.setBool("isDark", false);
                              } else if (MyApp.themeNotifier.value ==
                                  ThemeMode.dark) {
                                await prefs.setBool("isDark", true);
                              } else {
                                await prefs.setBool("isDark", false);
                              }
                            },
                            child: const Text('Change theme'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Cancel'),
                          ),
                        ],
                      );
                    });
              },
              icon: Icon(
                Icons.settings_outlined,
                size: 25,
                color: Theme.of(context).appBarTheme.iconTheme!.color,
              ),
            ),
        ],
      ),
    );
  }
}
