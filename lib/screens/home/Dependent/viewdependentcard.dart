import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vdart/model/dependentmodel.dart';
import 'package:vdart/utils.dart/styles.dart';

class ViewDependentCard extends StatelessWidget {
  const ViewDependentCard({
    this.data,
    Key key,
  }) : super(key: key);

  final DependentModel data;

  @override
  Widget build(BuildContext context) {
    List months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    int date = data.joinDate.day;
    print(date);
    int month = data.joinDate.month;
    print(month);
    int year = data.joinDate.year;
    print(year);

    final Size size = MediaQuery.of(context).size;
    double ht = size.height;
    double wt = size.width;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Grove",
        color: Colors.white,
        home: Scaffold(
            backgroundColor: bgcolor,
            body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 30, left: 5, right: 3),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          InkWell(
                            child: Image.asset('assets/images/arrowl.png',
                                height: 20, width: 20),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ]),
                  ),
                  Container(
                    height: wt,
                    width: wt / 1.1,
                    padding: EdgeInsets.all(7),
                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          _buildProfile(wt),
                          _buildName(wt),
                          _buildRole(wt),
                          _buildMob(wt),
                          _buildDomain(wt),
                          _buildLineManager(wt)
                        ],
                      ),
                    ),
                  ),
                  _buildBottom(wt, date, month, year, months),
                ])));
  }

  _buildBottom(double wt, int date, int month, int year, List l) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Center(
            child: Text(
          year.toString(),
          style: TextStyle(
              fontSize: wt / 15, color: fontColor, fontWeight: FontWeight.w800),
        )),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(l[++month].toString(),
                    style:
                        TextStyle(color: Colors.blueGrey, fontSize: wt / 25)),
                Text(
                  date.toString(),
                  style: TextStyle(fontSize: wt / 18),
                ),
              ],
            ),
            Container(
                child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    elevation: 10,
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        children: <Widget>[
                          CircleAvatar(
                            child: Icon(Icons.star_border, color: Colors.white),
                            backgroundColor: Colors.greenAccent[400],
                          ),
                          Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Container(
                                  child: Text("First day at Tailermade")))
                        ],
                      ),
                    )))
          ],
        )
      ],
    );
  }

  _buildName(double wt) {
    return Text(data.dname,
        style: TextStyle(
            fontSize: wt / 17,
            fontWeight: FontWeight.w800,
            color: fontColor,
            letterSpacing: 1));
  }

  _buildRole(double wt) {
    return Text(
      data.drole,
      style: TextStyle(fontSize: wt / 26, color: Colors.blueGrey),
    );
  }

  _buildMob(double wt) {
    return Text(data.dmob, style: TextStyle(fontSize: wt / 22));
  }

  _buildDomain(double wt) {
    return Text(data.demail, style: TextStyle(fontSize: wt / 22));
  }

  _buildLineManager(double wt) {
    return Text(
      "Line manager" + data.dlinemanager,
      style: TextStyle(fontSize: wt / 26, color: Colors.blueGrey),
    );
  }

  _buildProfile(double wt) {
    return CircleAvatar(
      radius: 32,
      backgroundColor: Colors.blueGrey[100],
      child: data.durl == null
          ? Icon(
              Icons.person,
              size: 31,
              color: Colors.white,
            )
          : Container(
              width: wt / 3,
              height: wt / 3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(data.durl),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(50.0),
                border: Border.all(
                  color: Colors.grey[100],
                  width: 5,
                ),
              ),
            ),
    );
  }
}
