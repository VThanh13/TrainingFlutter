import 'package:flutter/material.dart';

import 'biz_design/user_login/splash_screen/loading_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const MaterialApp(
      home: LoadingPage(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
