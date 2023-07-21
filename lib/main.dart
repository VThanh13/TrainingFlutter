import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'biz_design/core/setting/theme.dart';
import 'biz_design/router/app_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

AppRouter appRouter = AppRouter();

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    getThemeMode();
    super.initState();
  }

  Future<void> getThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final bool? mode = prefs.getBool("isDark");
    if (mode == null || mode == false) {
      MyApp.themeNotifier.value = ThemeMode.light;
    } else {
      MyApp.themeNotifier.value = ThemeMode.dark;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: MyApp.themeNotifier,
      builder: (context, currentMode, _) {
        return MaterialApp.router(
          routerConfig: appRouter.config(),
          debugShowCheckedModeBanner: false,
          themeMode: currentMode,
          theme: ThemeClass.lightTheme,
          darkTheme: ThemeClass.darkTheme,
        );
      },
    );
  }
}
