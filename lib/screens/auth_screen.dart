import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/authwidget.dart';

class AuthenticationScreen extends StatefulWidget {
  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final _authentication = FirebaseAuth.instance;
  var _isLoading = false;

  void sendAuthData(
    String email,
    String username,
    String password,
    bool isLogin,
    BuildContext ctx,
  ) async {
    AuthResult _authData;

    try {
      setState(() {
        _isLoading = true;
      });
      if (isLogin) {
        _authData = await _authentication.signInWithEmailAndPassword(
            email: email, password: password);
      } else {
        _authData = await _authentication.createUserWithEmailAndPassword(
            email: email, password: password);
        await Firestore.instance
            .collection('users')
            .document(_authData.user.uid)
            .setData({
          'username': username,
          'email': email,
        });
      }
    } on PlatformException catch (error) {
      var errMessage = "An Error Occured, Please check your Email and Password";
      if (error.message != null) {
        errMessage = error.message;
      }
      Scaffold.of(ctx).showSnackBar(
        SnackBar(
          content: Text(errMessage),
          backgroundColor: Theme.of(ctx).primaryColor,
        ),
      );
      setState(() {
        _isLoading = false;
      });
    } catch (error) {
      print(error);
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthWidget(sendAuthData, _isLoading),
    );
  }
}
