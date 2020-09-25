import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vdart/screens/activity/activity.dart';
import 'package:vdart/screens/home/homepageui.dart';
import 'package:vdart/screens/profile/profile.dart';
import 'package:vdart/screens/requests/requests.dart';
import 'package:vdart/utils.dart/styles.dart';

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  double ht, wt;
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomePage(),
    Requests(),
    Activity(),
    Profile(),
  ];
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    ht = MediaQuery.of(context).size.height;
    wt = MediaQuery.of(context).size.width;
    return MaterialApp(
      title: "Grove",
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      home: Scaffold(
        backgroundColor: bgcolor,
        body: _children[_currentIndex], // new
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,

          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: Colors.green[400],
          unselectedItemColor: Colors.grey[400],
          selectedLabelStyle: TextStyle(
            fontSize: wt / 37,
            color: Colors.green[400],
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: wt / 35,
            color: Colors.grey[400],
          ),

          onTap: onTabTapped, // new
          currentIndex: _currentIndex, // new
          items: [
            new BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            new BottomNavigationBarItem(
              icon: Icon(Icons.airplanemode_active),
              title: Text('Requests'),
            ),
            new BottomNavigationBarItem(
                icon: Icon(Icons.notifications), title: Text('Activity')),
            new BottomNavigationBarItem(
                icon: Icon(Icons.person_outline), title: Text('Profile'))
          ],
        ),
      ),
    );
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
