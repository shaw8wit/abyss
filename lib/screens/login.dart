import 'package:flutter/material.dart';

import 'drawer.dart';

enum AuthMode { signup, login }

class Auth extends StatelessWidget {
  static const routeName = '/auth';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Login(),
      ),
    );
  }
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  AuthMode _authMode = AuthMode.signup;

  void _switchMode() {
    if (_authMode == AuthMode.login) {
      setState(() {
        _authMode = AuthMode.signup;
      });
    } else {
      setState(() {
        _authMode = AuthMode.login;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Stack(
      overflow: Overflow.clip,
      children: <Widget>[
        Positioned(
          top: _authMode == AuthMode.login ? 15 : -80,
          right: _authMode == AuthMode.login ? -85 : deviceSize.width * 0.45,
          child: Container(
            height: 500,
            width: 470,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: _authMode == AuthMode.login
                    ? AssetImage('assets/images/login.png')
                    : AssetImage('assets/images/signup.png'),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment:
                    _authMode == AuthMode.login ? MainAxisAlignment.start : MainAxisAlignment.end,
                children: [
                  Text(
                    _authMode == AuthMode.login ? "Log In" : "Sign Up",
                    style: TextStyle(
                      fontSize: 34,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: deviceSize.height * 0.035),
            Container(
              margin: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              padding: EdgeInsets.all(25),
              height: 340,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xff32365B).withOpacity(0.8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextField(
                    style: TextStyle(color: Colors.white, fontSize: 18),
//                    autofocus: true,
                    textAlign: TextAlign.center,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      hintText: 'Enter email',
                      hintStyle: TextStyle(color: Colors.grey),
                      labelText: 'Email:',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                  TextField(
                    style: TextStyle(color: Colors.white, fontSize: 18),
                    textAlign: TextAlign.center,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      hintText: 'Enter password',
                      hintStyle: TextStyle(color: Colors.grey),
                      labelText: 'Password:',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 30),
                  OutlineButton(
                    shape: StadiumBorder(),
                    textColor: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(18),
                      child: Text(_authMode == AuthMode.login ? "Login" : "Signup",
                          style: TextStyle(fontSize: 18)),
                    ),
                    borderSide: BorderSide(color: Colors.indigoAccent[100], style: BorderStyle.solid, width: 3),
                    onPressed: () {
                      Navigator.of(context).popAndPushNamed(SideMenu.routeName, arguments: 1);
                    },
                  ),
                  SizedBox(height: 10),
                  FlatButton(
                    child: Text('${_authMode == AuthMode.login ? 'SIGNUP' : 'LOGIN'} INSTEAD'),
                    onPressed: _switchMode,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ],
              ),
            ),
            Spacer(),
            if (deviceSize.height > 475)
              Container(
                height: 100,
                width: 100,
                transform: Matrix4.rotationZ(10 * 3.14 / 180),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: _authMode == AuthMode.login
                        ? AssetImage('assets/images/t1.png')
                        : AssetImage('assets/images/t2.png'),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
