import 'package:flutter/material.dart';
import 'package:vdart/screens/profile/editingjobinfo.dart';
import 'package:vdart/screens/profile/infodata.dart';
import 'package:vdart/utils.dart/styles.dart';

class JobInfo extends StatefulWidget {
  @override
  _JobInfo createState() => _JobInfo();
}

class _JobInfo extends State<JobInfo> {
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
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        setState(() {
                          print("press profileinfo edit page");
                          //navigate to edit page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => JobEditingPage()),
                          );
                        });
                      },
                    ),
                  )
                ]),
          ),
          Card(
              color: Colors.white,
              child: Container(
                width: wt,
                padding: EdgeInsets.all(9.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.all(7.0), child: _buildHead()),
                    combo("Employee Status", i.employeeStatusC),
                    combo("Join Date", i.joinDateC),
                    combo("Job Title", i.jobtitleC),
                    combo("Department", i.departmentC),
                    combo("Office", i.officeC),
                    combo("Line Manager", i.lineManagerC),
                    combo("Employment Type", i.employmentTypeC),
                    combo("Probation Start Date", i.probationstartdateC),
                    combo("Probation End Date", i.probationenddateC),
                    combo("Contract Start Date", i.contractstartdateC),
                    combo("Contract End Date", i.contractenddateC),
                  ],
                ),
              ))
        ]))));
  }

  Widget combo(String label, TextEditingController t) {
    return Container(
        padding: EdgeInsets.all(4.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _buildLabel(label),
              _buildField(t),
            ]));
  }

  Widget _buildHead() {
    return Text(
      "Job Information",
      style: hst.copyWith(fontSize: wt / 19),
    );
  }

  Widget _buildLabel(String label) {
    return Text(label, style: lst.copyWith(fontSize: wt / 25));
  }

  Widget _buildField(TextEditingController c) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      color: cardColor,
      child: Center(
        child: TextFormField(
          controller: c,
          readOnly: true,
          enableInteractiveSelection: false,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: wt / 26,
              height: 0.4,
              color: fontColor,
              letterSpacing: 0.5,
              fontWeight: FontWeight.w500),
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide.none),
          ),
        ),
      ),
    );
  }
}
