import 'package:code/week6/demo_bloc/features/home/ui/home.dart';

import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(  MaterialApp(
    home: const HomeDemoBloc(),
    theme: ThemeData(
      primarySwatch: Colors.teal,
    ),
    debugShowCheckedModeBanner: false,
  ));
}