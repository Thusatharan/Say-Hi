import 'package:SayHi/screens/chat_screen.dart';

import './screens/auth_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        primaryColor: Colors.lightGreen,
        accentColor: Colors.greenAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AuthenticationScreen(),
    );
  }
}
