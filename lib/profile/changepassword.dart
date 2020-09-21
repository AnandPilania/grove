import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vdart/dashboard/home.dart';
import 'package:vdart/dashboard/profile.dart';
import 'package:vdart/globals.dart';
import 'package:vdart/utils.dart/styles.dart';
import 'errorchangedialogue.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePassword createState() => _ChangePassword();
}

class _ChangePassword extends State<ChangePassword> {
  double ht, wt;
  String cpwd, npwd, confirmpwd;
  bool _visibilityC = false;
  bool _visibilityN = false;
  bool _visibilityCo = false;
  bool _disable = false;
  bool _discard = false;

  FocusNode curfocusnode, newfocusnode, confirmfocusnode;
  TextEditingController curController, newController, confirmController;

  @override
  void initState() {
    curfocusnode = new FocusNode();
    newfocusnode = new FocusNode();
    confirmfocusnode = new FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    ht = MediaQuery.of(context).size.height;
    wt = MediaQuery.of(context).size.width;
    var st = TextStyle(
        fontSize: wt / 24, color: Colors.blueGrey[400], letterSpacing: 0.5);
    return WillPopScope(
        onWillPop: _showAlert,
        child: MaterialApp(
          title: "Grove",
          debugShowCheckedModeBanner: false,
          color: Colors.white,
          home: Scaffold(
            body: SingleChildScrollView(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10.0),
                  height: wt / 1.5,
                  //color: Colors.red,
                  width: wt,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(3.0),
                        child: InkWell(
                          child: Image.asset('assets/images/arrowl.png',
                              height: 20, width: 20),
                          onTap: () {
                            _discard ? _showAlert() : Navigator.pop(context);
                          },
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text("Change Password",
                              style: TextStyle(
                                  fontSize: wt / 15,
                                  letterSpacing: 1,
                                  color: Colors.green[400],
                                  fontWeight: FontWeight.bold)),
                          SizedBox(height: 20),
                          Text("For best security practices,  you", style: st),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            "should change your password",
                            style: st,
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            "periodically.",
                            style: st,
                          ),
                          SizedBox(
                            height: 3,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(3.0),
                        child: _showCurrentPassword(),
                      ),
                      Padding(
                        padding: EdgeInsets.all(3.0),
                        child: _showNewPassword(),
                      ),
                      Padding(
                        padding: EdgeInsets.all(3.0),
                        child: _showConfirmPassword(),
                      ),
                      Padding(
                        padding: EdgeInsets.all(3.0),
                        child: _showPasswordCondition(),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(3.0),
                  child: _showButton(),
                ),
              ],
            )),
          ),
        ));
  }

  Widget _showCurrentPassword() {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        // elevation: 5,
        color: cardColor,
        child: Center(
            child: TextFormField(
          // textAlign: TextAlign.center,
          onChanged: (value) {
            setState(() {
              cpwd = value;
            });
          },
          focusNode: curfocusnode,
          onFieldSubmitted: (String value) {
            curfocusnode.unfocus();
            newfocusnode.requestFocus();
          },
          style: TextStyle(
            fontSize: wt / 22,
            height: 1.4,
            color: Colors.black,
            letterSpacing: 1,
          ),
          obscureText: !_visibilityC,
          showCursor: true,
          controller: curController,
          keyboardType: TextInputType.text,

          cursorColor: Colors.green[800],

          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: _visibilityC
                  ? Icon(
                      Icons.visibility,
                      size: 27,
                      color: Colors.blueGrey[400],
                    )
                  : Icon(
                      Icons.visibility_off,
                      size: 27,
                      color: Colors.blueGrey[400],
                    ),
              onPressed: () {
                setState(() {
                  _visibilityC = !_visibilityC;
                });
              },
            ),
            hintText: "Current Password",
            hintStyle: TextStyle(
                fontSize: wt / 23,
                letterSpacing: 0.5,
                fontWeight: FontWeight.w400,
                color: Colors.blueGrey[400]),

            /*   errorText: _validaten
                                      ? 'Name must contains atleast 4 characters'
                                      : null,
                                  errorStyle: TextStyle(
                                    fontSize: wt / 33,
                                    color: Colors.black45,
                                  ),*/
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide.none),
          ),
        )));
  }

  Widget _showNewPassword() {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        // elevation: 5,
        color: cardColor,
        child: Center(
            child: TextFormField(
          // textAlign: TextAlign.center,
          onChanged: (value) {
            setState(() {
              npwd = value;
            });
          },
          focusNode: newfocusnode,
          onFieldSubmitted: (String value) {
            if (cpwd == npwd) {
              newfocusnode.unfocus();
              confirmfocusnode.requestFocus();
            } else {
              _showErrorChange(context,
                  "New Password and Confirm Password must be same.\n\nPassword must contain atleast 1 upper case letter. Password must contain atleast 1 number. \nPassword must contain atleast 1 special character.\n");

              newfocusnode.unfocus();
              curfocusnode.requestFocus();
            }
          },
          style: TextStyle(
            fontSize: wt / 22,
            height: 1.4,
            color: Colors.black,
            letterSpacing: 1,
          ),
          obscureText: !_visibilityN,
          showCursor: true,
          controller: newController,
          keyboardType: TextInputType.text,

          cursorColor: Colors.green[800],

          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: _visibilityN
                  ? Icon(
                      Icons.visibility,
                      size: 27,
                      color: Colors.blueGrey[400],
                    )
                  : Icon(
                      Icons.visibility_off,
                      size: 27,
                      color: Colors.blueGrey[400],
                    ),
              onPressed: () {
                setState(() {
                  _visibilityN = !_visibilityN;
                });
              },
            ),
            hintText: "New Password",
            hintStyle: TextStyle(
                fontSize: wt / 23,
                letterSpacing: 0.5,
                fontWeight: FontWeight.w400,
                color: Colors.blueGrey[400]),

            /*   errorText: _validaten
                                      ? 'Name must contains atleast 4 characters'
                                      : null,
                                  errorStyle: TextStyle(
                                    fontSize: wt / 33,
                                    color: Colors.black45,
                                  ),*/
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide.none),
          ),
        )));
  }

  Widget _showConfirmPassword() {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        // elevation: 5,
        color: cardColor,
        child: Center(
            child: TextFormField(
          // textAlign: TextAlign.center,
          onChanged: (value) {
            setState(() {
              confirmpwd = value;
            });
          },
          focusNode: confirmfocusnode,
          onFieldSubmitted: (String value) {
            _discard = !_discard;
            print("Confrim pssword is" + confirmpwd);
            if (confirmpwd == npwd) {
              _showErrorChange(context,
                  "New Password must be different from Current Password.\nNew Password and confirm Password must be the same.");
            } else if (confirmpwd != npwd) {
              if (confirmpwd.length < 8 ||
                  confirmpwd == null ||
                  confirmpwd == '') {
                _showErrorChange(context,
                    "New Password and Confirm Password must be same.\n\nPassword must contain atleast 1 upper case letter. Password must contain atleast 1 number. \nPassword must contain atleast 1 special character.\n");
              } else {
                confirmfocusnode.unfocus();
                setState(() {
                  _disable = !_disable;
                });
              }
            }
          },
          style: TextStyle(
            fontSize: wt / 22,
            height: 1.4,
            color: Colors.black,
            letterSpacing: 1,
          ),
          obscureText: !_visibilityCo,
          controller: confirmController,
          showCursor: true,
          keyboardType: TextInputType.text,

          cursorColor: Colors.green[800],

          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: _visibilityCo
                  ? Icon(
                      Icons.visibility,
                      size: 27,
                      color: Colors.blueGrey[400],
                    )
                  : Icon(
                      Icons.visibility_off,
                      size: 27,
                      color: Colors.blueGrey[400],
                    ),
              onPressed: () {
                setState(() {
                  _visibilityCo = !_visibilityCo;
                });
              },
            ),
            hintText: "Confirm Password",
            hintStyle: TextStyle(
                fontSize: wt / 23,
                letterSpacing: 0.5,
                fontWeight: FontWeight.w400,
                color: Colors.blueGrey[400]),

            /*   errorText: _validaten
                                      ? 'Name must contains atleast 4 characters'
                                      : null,
                                  errorStyle: TextStyle(
                                    fontSize: wt / 33,
                                    color: Colors.black45,
                                  ),*/
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide.none),
          ),
        )));
  }

  Widget _showPasswordCondition() {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Icon(Icons.info_outline, size: 20),
        Column(
          children: <Widget>[
            Container(
                height: wt / 4,
                width: wt / 1.3,
                child: Text(
                    "At least : \n 8 characters * 1 upper case letter * 1 lower case letter * 1 number * 1 special character",
                    style: TextStyle(
                        fontSize: wt / 30, letterSpacing: 0.4, height: 1.6)))
          ],
        )
      ],
    ));
  }

  Widget _showButton() {
    return InkWell(
        child: Container(
            width: wt / 1.1,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
              // elevation: 5,
              color: !_disable ? Colors.grey[200] : Colors.green[400],
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                    child: Text("Change Password",
                        style: TextStyle(
                            fontSize: wt / 22,
                            fontWeight: FontWeight.w800,
                            color: Colors.white))),
              ),
            )),
        onTap: _discard
            ? () async {
                var f = 0;
                SharedPreferences vdart = await SharedPreferences.getInstance();
                setState(() {
                  if (f == 0) {
                    setState(() {
                      vdart.setString("password", confirmpwd);

                      //Changed Password

                      print("changed your password");
                      notilist.add("Your password has been changed.");
                      Navigator.pop(context);
                      // Navigator.pushReplacement(context);
                    });
                  }
                });
              }
            : null);
  }

  _showErrorChange(BuildContext context, String st) {
    return showDialog(
        context: context,
        builder: (context) => new AlertDialog(
                title: new Text('Error Change Password'),
                content: new SizedBox(
                  child: Text(st),
                ),
                actions: <Widget>[
                  new FlatButton(
                      child: Text(
                        "Ok",
                        style: TextStyle(color: Colors.green[800]),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        // AppSettings.openWIFISettings();
                      }),
                ]));
  }

  Future<bool> _showAlert() {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text(
          'Discard change?',
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
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
            child: Text("DISCARD",
                style: TextStyle(color: Colors.green[800], fontSize: wt / 25)),
          ),
          SizedBox(height: wt / 20),
        ],
      ),
    );
  }
}
