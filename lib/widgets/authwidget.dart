import 'package:flutter/material.dart';

class AuthWidget extends StatefulWidget {
  AuthWidget(this.formSubmit, this.isLoading);

  final bool isLoading;
  final void Function(
    String email,
    String username,
    String password,
    bool isLoginScreen,
    BuildContext ctx,
  ) formSubmit;
  @override
  _AuthWidgetState createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  final _formKey = GlobalKey<FormState>();

  var _isLogin = true;
  var userEmail = "";

  var userName = "";

  var userPassword = "";

  void _trySubmit() {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState.save();
      widget.formSubmit(
        userEmail.trim(),
        userName.trim(),
        userPassword,
        _isLogin,
        context,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/hangingname.png'),
                    fit: BoxFit.cover)),
            width: double.infinity,
          ),
        ),
        Expanded(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                if (!_isLogin)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 10.0),
                    child: Card(
                      elevation: 10,
                      color: Colors.lightGreen[200],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      child: TextFormField(
                        key: ValueKey('userame'),
                        validator: (value) {
                          if (value.isEmpty || value.length < 3) {
                            return "This username is very short";
                          }
                          return null;
                        },
                        cursorHeight: 20,
                        decoration: InputDecoration(
                          fillColor: Theme.of(context).primaryColor,
                          contentPadding: EdgeInsets.all(16.0),
                          prefixIcon: Container(
                            padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                            margin: EdgeInsets.only(right: 8.0),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30.0),
                                topRight: Radius.circular(30.0),
                                bottomLeft: Radius.circular(30.0),
                                bottomRight: Radius.circular(10.0),
                              ),
                            ),
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                          ),
                          hintText: "Enter Username",
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                        ),
                        onSaved: (value) {
                          userName = value;
                        },
                      ),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 10.0),
                  child: Card(
                    color: Colors.lightGreen[200],
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    child: TextFormField(
                      key: ValueKey('email'),
                      validator: (value) {
                        if (value.isEmpty || !value.contains('@')) {
                          return "Please Enter a valid email address";
                        }
                        return null;
                      },
                      cursorHeight: 20,
                      decoration: InputDecoration(
                        fillColor: Colors.amber,
                        contentPadding: EdgeInsets.all(16.0),
                        prefixIcon: Container(
                          padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                          margin: EdgeInsets.only(right: 8.0),
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.0),
                              topRight: Radius.circular(30.0),
                              bottomLeft: Radius.circular(30.0),
                              bottomRight: Radius.circular(10.0),
                            ),
                          ),
                          child: Icon(
                            Icons.mail,
                            color: Colors.white,
                          ),
                        ),
                        hintText: "Enter Email",
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                      onSaved: (value) {
                        userEmail = value;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 10.0),
                  child: Card(
                    color: Colors.lightGreen[200],
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    child: TextFormField(
                      key: ValueKey('password'),
                      validator: (value) {
                        if (value.isEmpty || value.length < 5) {
                          return "Length must be greater than 5";
                        }
                        return null;
                      },
                      cursorHeight: 20,
                      decoration: InputDecoration(
                        fillColor: Colors.amber,
                        contentPadding: EdgeInsets.all(16.0),
                        prefixIcon: Container(
                          padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                          margin: EdgeInsets.only(right: 8.0),
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.0),
                              topRight: Radius.circular(30.0),
                              bottomLeft: Radius.circular(30.0),
                              bottomRight: Radius.circular(10.0),
                            ),
                          ),
                          child: Icon(
                            Icons.lock,
                            color: Colors.white,
                          ),
                        ),
                        hintText: "Enter Password",
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                      obscureText: true,
                      onSaved: (value) {
                        userPassword = value;
                      },
                    ),
                  ),
                ),
                if (!_isLogin)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 10.0),
                    child: Card(
                      color: Colors.lightGreen[200],
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      child: TextFormField(
                        key: ValueKey('confirmpassword'),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Password does not match";
                          }
                          return null;
                        },
                        cursorHeight: 20,
                        decoration: InputDecoration(
                            fillColor: Colors.amber,
                            contentPadding: EdgeInsets.all(16.0),
                            prefixIcon: Container(
                              padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                              margin: EdgeInsets.only(right: 8.0),
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30.0),
                                  topRight: Radius.circular(30.0),
                                  bottomLeft: Radius.circular(30.0),
                                  bottomRight: Radius.circular(10.0),
                                ),
                              ),
                              child: Icon(
                                Icons.repeat,
                                color: Colors.white,
                              ),
                            ),
                            hintText: "Confirm Password",
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none)),
                        obscureText: true,
                      ),
                    ),
                  ),
                (widget.isLoading)
                    ? Container(
                        margin: EdgeInsets.only(top: 10),
                        child: CircularProgressIndicator(),
                      )
                    : Container(
                        width: double.infinity,
                        padding:
                            EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                        child: RaisedButton(
                          color: Theme.of(context).primaryColor,
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          onPressed: _trySubmit,
                          child: Text(
                            (_isLogin) ? 'Start Chatting' : 'Create My Account',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
        if (!widget.isLoading)
          FlatButton(
            child: Text(
              (_isLogin) ? 'Create New Account' : 'Already have account',
              style: TextStyle(color: Theme.of(context).primaryColorDark),
            ),
            onPressed: () {
              setState(() {
                _isLogin = !_isLogin;
              });
            },
          )
      ],
    );
  }
}
