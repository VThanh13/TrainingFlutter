
import 'package:flutter/material.dart';

import 'biz_design/user_login/user_login_1/loading_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(  const MaterialApp(
    home: LoadingPage(),
    debugShowCheckedModeBanner: false,
  ));
}