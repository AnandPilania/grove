import 'package:flutter/material.dart';
import 'package:vdart/profile/dependentedit.dart';
import 'package:vdart/profile/editingjobinfo.dart';
import 'package:vdart/profile/editingpersonalinfo.dart';
import 'package:vdart/profile/infodata.dart';
import 'package:vdart/signin.dart';
import 'package:vdart/utils.dart/styles.dart';

class DependentDoc extends StatefulWidget {
  @override
  _DependentDoc createState() => _DependentDoc();
}

class _DependentDoc extends State<DependentDoc> {
  double ht, wt;
  var hst = TextStyle(
      color: fontColor, letterSpacing: 1, fontWeight: FontWeight.w700);
  var lst = TextStyle(
      letterSpacing: 0.5,
      fontWeight: FontWeight.w500,
      color: Colors.blueGrey[400]);
  InfoData i = new InfoData();

  @override
  void initState() {
    //   i.data();
    print("Data is" + i.fullNameC.text);
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
            body: SingleChildScrollView(
                child: Column(children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Container(
            height: wt / 6,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: InkWell(
                      child: Image.asset('assets/images/arrowl.png',
                          height: 20, width: 20),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ]),
          ),
          Card(
              color: Colors.white,
              child: Container(
                height: ht,
                width: wt,
                padding: EdgeInsets.all(9.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.all(7.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.all(7.0),
                                child: _buildHead()),
                            Padding(
                              padding: EdgeInsets.all(7.0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DependentEditingPage()),
                                  );
                                },
                                child: Text(
                                  "Add",
                                  style: TextStyle(
                                      fontSize: wt / 26,
                                      color: Colors.green[400],
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            )
                          ],
                        )),
                  ],
                ),
              ))
        ]))));
  }

  Widget _buildHead() {
    return Text(
      "Dependents",
      style: hst.copyWith(fontSize: wt / 22),
    );
  }
}
