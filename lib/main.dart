import 'package:code/week5/demo%20rest%20API/views/home_demo_api.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( const MaterialApp(
    home: HomeDemoAPI(),
    debugShowCheckedModeBanner: false,
  ));
}