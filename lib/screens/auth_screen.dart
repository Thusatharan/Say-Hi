import 'package:flutter/material.dart';
import '../widgets/authwidget.dart';

class AuthenticationScreen extends StatefulWidget {
  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  void sendAuthData(
    String email,
    String username,
    String password,
    bool isLogin,
  ) {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthWidget(sendAuthData),
    );
  }
}
