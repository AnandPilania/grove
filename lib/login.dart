import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vdart/checknet.dart';
import 'package:vdart/dashboard/home.dart';
import 'package:vdart/divider.dart';
import 'package:vdart/globals.dart';
import 'package:vdart/signin.dart';
import 'package:vdart/socialicon.dart';
import 'package:vdart/utils.dart/styles.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;

class LoginPage extends StatefulWidget {
  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  GlobalKey<FormState> _key = GlobalKey();
  bool _validatee = false;
  bool _validatep = false;
  FocusNode emailfocusnode, pwdfocusnode;
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  bool _isLoggedIn = false;
  Map userProfile;
  final facebookLogin = FacebookLogin();
  String _message = 'Log in/out by pressing the buttons below.';
  String pass;
  double ht, wt;
  @override
  void initState() {
    super.initState();
    emailfocusnode = FocusNode();
    pwdfocusnode = FocusNode();
    //  firebaseCloudMessaging();
  }

  @override
  void dispose() {
    emailfocusnode.dispose();
    pwdfocusnode.dispose();
    super.dispose();
  }

  _loginWithFB() async {
    final result = await facebookLogin.logInWithReadPermissions(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final token = result.accessToken.token;
        final graphResponse = await http.get(
            'https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=${token}');
        final profile = JSON.jsonDecode(graphResponse.body);
        print(profile);
        setState(() {
          userProfile = profile;
          email = userProfile['email'];
          print(email);
          _isLoggedIn = true;
        });
        break;

      case FacebookLoginStatus.cancelledByUser:
        setState(() => _isLoggedIn = false);
        break;
      case FacebookLoginStatus.error:
        setState(() => _isLoggedIn = false);
        break;
    }
  }

  _logout() {
    facebookLogin.logOut();
    setState(() {
      _isLoggedIn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    ht = MediaQuery.of(context).size.height;
    wt = MediaQuery.of(context).size.width;
    return WillPopScope(
        onWillPop: _showAlert,
        child: MaterialApp(
          title: 'Grove one',
          debugShowCheckedModeBanner: false,
          color: Colors.white,
          home: Scaffold(
              body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                    padding: EdgeInsets.only(
                      top: 20.0,
                    ),
                    height: wt / 1.6,
                    width: wt / 3,
                    child: Column(
                      children: <Widget>[
                        FlutterLogo(
                          size: 150,
                        ),
                        SizedBox(height: 4),
                        Expanded(
                            child: Text("Grove",
                                style: onboardingtitle.copyWith(
                                    fontSize: wt / 18)))
                      ],
                    )),
                Container(
                  //height: ht / 7,
                  padding: EdgeInsets.only(left: ht / 20, right: 10.0),
                  child: Center(
                    child: Text(
                      "This app will be your HR assistant throughout your journey and give you the neccessary support to succeed.",
                      style: onboardingsubtitle.copyWith(fontSize: wt / 27),
                    ),
                  ),
                ),
                Container(
                  // height: ht / 1.9,
                  padding: EdgeInsets.all(5.0),
                  child: Column(
                    children: <Widget>[
                      form(),
                      // Text(_message),
                      OrDivider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SocalIcon(
                            iconSrc: "assets/images/google-plus.svg",
                            press: () {
                              //do google signin
                              checkingnet(context);

                              if (checknet == 'connected') {
                                signInWithGoogle().whenComplete(() {
                                  if (email == null) {
                                    // toast(context, "Sorry!You are not signin properly! try again!");
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return LoginPage();
                                        },
                                      ),
                                    );
                                  } else {
                                    storeData();
                                    // toast(context, "Successfully signin your google account!");
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return Home();
                                        },
                                      ),
                                    );
                                  }
                                });
                              }
                            },
                          ),
                          SocalIcon(
                            iconSrc: "assets/images/facebook.svg",
                            press: () {
                              //signin with facebook
                              checkingnet(context);

                              if (checknet == 'connected') {
                                _loginWithFB().whenComplete(() {
                                  if (email == null) {
                                    // toast(context, "Sorry!You are not signin properly! try again!");
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return LoginPage();
                                        },
                                      ),
                                    );
                                  } else {
                                    storeData();
                                    // toast(context, "Successfully signin your google account!");
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return Home();
                                        },
                                      ),
                                    );
                                  }
                                });
                              }
                            },
                          ),
                          SocalIcon(
                            iconSrc: "assets/images/linked.jpeg",
                            press: () {},
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
        ));
  }

  Widget form() {
    return Container(
        padding: EdgeInsets.all(25.0),
        //  margin: EdgeInsets.all(1.0),
        child: Card(
          key: _key,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
          elevation: 10,
          shadowColor: Color(0xFF6F35A5),
          child: Container(
            padding: EdgeInsets.all(7.0),
            child: Column(
              children: <Widget>[
                //name
                emailTextFormField(),
                //mobile
                pwdTextFormField(),
                Padding(
                  padding: EdgeInsets.all(6.0),
                  child: button(),
                )
              ],
            ),
          ),
        ));
  }

  Widget emailTextFormField() {
    return TextFormField(
      onChanged: (value) {
        email = value;
      },
      focusNode: emailfocusnode,
      onFieldSubmitted: (String value) {
        //   namefocusnode.unfocus();
        pwdfocusnode.requestFocus();
      },
      style: TextStyle(
          fontSize: wt / 25,
          color: Colors.black,
          letterSpacing: 1,
          fontWeight: FontWeight.w600),
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      cursorColor: Color(0xFF6F35A5),
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person, color: Color(0xFF6F35A5), size: 28),
        hintText: "User Email",
        hintStyle: TextStyle(fontSize: wt / 26, color: Colors.grey[500]),
        errorText: _validatee ? 'Email shoud be in correct format' : null,
        errorStyle: TextStyle(
          fontSize: wt / 28,
          color: Colors.deepPurple,
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide.none),
      ),
    );
  }

  Widget pwdTextFormField() {
    return TextFormField(
      onChanged: (value) {
        pass = value;
      },
      focusNode: pwdfocusnode,
      onFieldSubmitted: (String value) {
        pwdfocusnode.unfocus();
        //  mobilefocusnode.requestFocus();
      },
      style: TextStyle(
          fontSize: wt / 25,
          color: Colors.black,
          letterSpacing: 1,
          fontWeight: FontWeight.w600),
      controller: pwdController,
      keyboardType: TextInputType.text,
      cursorColor: Color(0xFF6F35A5),
      obscureText: true,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.call, color: Color(0xFF6F35A5), size: 28),
        hintText: "Password",
        hintStyle: TextStyle(fontSize: wt / 26, color: Colors.grey[500]),
        errorText: _validatep ? 'Invalid Password' : null,
        errorStyle: TextStyle(
          fontSize: wt / 28,
          color: Colors.deepPurple,
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide.none),
      ),
    );
  }

  Widget button() {
    return RaisedButton(
        onPressed: () async {
          /*  _locationData = await location.getLocation();
            print(_locationData.latitude);
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setString('latitude', _locationData.latitude.toString());
            prefs.setString('longitude', _locationData.longitude.toString());
            */

          setState(() {
            var f = 0;
            _validatee = false;
            _validatep = false;

            if (email == null || email == '' || !email.contains('@gmail.com')) {
              _validatee = true;

              f = 1;
            }
            if (pass == null || (pass.length < 6)) {
              _validatep = true;

              f = 1;
            }
            if (f == 0) {
              // toast(context, "Your $name and Mobile $mobno saved!");
              storeData();

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            }
          });
        },
        color: Colors.deepPurple,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
          child: Text('Signin',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: wt / 28,
                  fontWeight: FontWeight.w600)),
        ),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(40.0)),
        ));
  }

  storeData() async {
    SharedPreferences vdart = await SharedPreferences.getInstance();
    setState(() {
      vdart.setBool('first_time', false);
      print("bool value changed");
      vdart.setString('email', email);
      vdart.setString('password', pass);
      /* prefs.setString('url', imageUrl);
      prefs.setString('name', sname);
      prefs.setString('mobno', mobno);*/
    });
  }

  Future<bool> _showAlert() {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text(
          'Are you want to exit?',
          style: TextStyle(fontSize: wt / 20),
        ),
        elevation: 5,
        contentPadding: EdgeInsets.all(20),
        content: SizedBox(
          height: wt / 20,
        ),
        actions: <Widget>[
          new GestureDetector(
            onTap: () => Navigator.of(context).pop(false),
            child: Text("CANCEL",
                style: TextStyle(color: Colors.green[800], fontSize: wt / 25)),
          ),
          SizedBox(height: 16),
          new GestureDetector(
            onTap: () {
              //write code for discard\
              //  Navigator.of(context).pop(true);
              SystemNavigator.pop();
            },
            child: Text("YES",
                style: TextStyle(color: Colors.green[800], fontSize: wt / 25)),
          ),
          SizedBox(height: wt / 20),
        ],
      ),
    );
  }
}
