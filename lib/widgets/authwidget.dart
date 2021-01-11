import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class AuthWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              ClipPath(
                clipper: WaveClipperTwo(),
                child: Container(
                  foregroundDecoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.orange[300],
                      Color.fromRGBO(247, 216, 166, 0.2),
                    ]),
                  ),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/bg.jpg'),
                          fit: BoxFit.cover)),
                  height: 300,
                  width: double.infinity,
                ),
              ),
              Center(
                child: Text(
                  'Say Hi',
                  style: TextStyle(color: Colors.white, fontSize: 50),
                ),
              ),
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              child: TextFormField(
                validator: (value) {
                  if (value.isEmpty || value.length < 3) {
                    return "This username is very short";
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
                        color: Colors.orange,
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
                    border: OutlineInputBorder(borderSide: BorderSide.none)),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              child: TextFormField(
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
                        color: Colors.orange,
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
                    border: OutlineInputBorder(borderSide: BorderSide.none)),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              child: TextFormField(
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
                        color: Colors.orange,
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
                    border: OutlineInputBorder(borderSide: BorderSide.none)),
                obscureText: true,
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              child: TextFormField(
                cursorHeight: 20,
                decoration: InputDecoration(
                    fillColor: Colors.amber,
                    contentPadding: EdgeInsets.all(16.0),
                    prefixIcon: Container(
                      padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                      margin: EdgeInsets.only(right: 8.0),
                      decoration: BoxDecoration(
                        color: Colors.orange,
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
                    border: OutlineInputBorder(borderSide: BorderSide.none)),
                obscureText: true,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
            child: RaisedButton(
              color: Theme.of(context).accentColor,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              onPressed: () {},
              child: Text(
                'Create My Account',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          Text(
            'Forgot Password',
            style: TextStyle(color: Theme.of(context).primaryColorDark),
          )
        ],
      ),
    );
  }
}
