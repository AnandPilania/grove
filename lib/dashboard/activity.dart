import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vdart/globals.dart';
import 'package:vdart/utils.dart/styles.dart';

class Activity extends StatefulWidget {
  @override
  _Activity createState() => _Activity();
}

class _Activity extends State<Activity> {
  var hst = TextStyle(
      color: fontColor, letterSpacing: 1, fontWeight: FontWeight.w700);
  double ht, wt;
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    ht = MediaQuery.of(context).size.height;
    wt = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Grove",
      home: Scaffold(
          backgroundColor: bgcolor,
          body: Container(
            height: ht,
            width: wt,
            padding: EdgeInsets.only(top: 30.0, left: 2.0, right: 2.0),
            child: Container(
              color: Colors.white,
              child: Column(children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            "Activity",
                            style: hst.copyWith(fontSize: wt / 18),
                          )),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: IconButton(
                          icon: Icon(Icons.clear_all),
                          onPressed: () {
                            //refresed
                          },
                        ),
                      ),
                    ]),
                Container(
                    height: ht / 1.3,
                    width: wt,
                    child: ListView.builder(
                        itemCount: notilist.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                              height: wt / 4,
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.blueGrey[100],
                                          width: 0.7))),
                              // color: Colors.red,
                              padding: EdgeInsets.all(15.0),
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: CircleAvatar(
                                        backgroundColor: Colors.blueGrey[200],
                                        radius: 17,
                                        child: Icon(Icons.notifications,
                                            color: Colors.white, size: 23)),
                                  ),
                                  Container(
                                      child: Expanded(
                                          child: Text(notilist[index],
                                              style: TextStyle(
                                                color: fontColor,
                                                fontSize: wt / 25,
                                              ))))
                                ],
                              ));

                          //Text(notilist[index]);
                        }))
              ]),
            ),
          )),
    );
  }
}
