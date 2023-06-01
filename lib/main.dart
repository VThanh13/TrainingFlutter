import 'package:code/biz_design/id_a/id_a_1/loading_page.dart';

import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(  const MaterialApp(
    home: LoadingPage(),
    debugShowCheckedModeBanner: false,
  ));
}