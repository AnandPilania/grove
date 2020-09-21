import 'package:flutter/material.dart';
import 'package:vdart/globals.dart';
import 'package:vdart/profile/infodata.dart';
import 'package:vdart/utils.dart/styles.dart';

class EmergencyEditingPage extends StatefulWidget {
  @override
  _EmergencyEditingPage createState() => _EmergencyEditingPage();
}

class _EmergencyEditingPage extends State<EmergencyEditingPage> {
  String _dropDownRelationValue;

  double ht, wt;
  List relationlist = [
    'Father',
    'Mother',
    'Parent',
    'Spouse',
    'Sibling',
    'Friend',
    'Other'
  ];

  var hst = TextStyle(
      color: fontColor, letterSpacing: 1, fontWeight: FontWeight.w700);
  var lst = TextStyle(
      letterSpacing: 0.5,
      fontWeight: FontWeight.w500,
      color: Colors.blueGrey[400]);
  InfoData i = new InfoData();
  String fullname, phnno, relation;

  @override
  void initState() {
    //  i.data();
    //remodify the pickeddate value as from DB
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
                      child: Text(
                        "CANCEL",
                        style: TextStyle(
                            fontSize: wt / 20,
                            color: Colors.blueGrey[600],
                            fontWeight: FontWeight.w500),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: InkWell(
                      child: Text(
                        "SAVE",
                        style: TextStyle(
                            fontSize: wt / 20,
                            color: Colors.green[300],
                            fontWeight: FontWeight.w500),
                      ),
                      onTap: () {
                        // _savedData();
                        notilist.add(
                            "Your information in Emergency Contact info has been changed.");
                        print("saved");
                        Navigator.pop(context);
                      },
                    ),
                  ),
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
                    combo('Full Name', i.fullNameC, 1),

                    combo('Phone Number', i.phnnoC, 2),
                    chooseRelationDropBox('RelationShip'),
                    // combo('Gender', i.genderC, 7),

                    /*   ListTile(
                      title: Text(
                          "Date:  ${pickedDate.day}/${pickedDate.month}/${pickedDate.year}",
                          style: TextStyle(fontWeight: FontWeight.w900)),
                      trailing: Icon(Icons.keyboard_arrow_down),
                      onTap: _pickDate,
                    ),*/
                  ],
                ),
              ))
        ]))));
  }

  Widget chooseRelationDropBox(String label) {
    return Container(
        padding: EdgeInsets.all(4.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _buildLabel(label),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
                color: cardColor,
                child: Center(
                  child: DropdownButton(
                    iconEnabledColor: Colors.green[300],
                    iconDisabledColor: Colors.green[300],
                    underline: SizedBox(height: 0.8),
                    hint: _dropDownRelationValue == null
                        ? Center(
                            child: Text(
                            "Select Relationship",
                            style: TextStyle(
                                fontSize: wt / 26,
                                height: 1,
                                color: Colors.blueGrey[300],
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.w500),
                          ))
                        : Center(
                            child: Text(
                            _dropDownRelationValue,
                            style: TextStyle(
                                fontSize: wt / 26,
                                height: 1,
                                color: fontColor,
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.w500),
                          )),
                    isExpanded: true,
                    iconSize: 28.0,
                    style: TextStyle(
                        fontSize: wt / 30,
                        color: Colors.black,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w600),
                    isDense: false,
                    items: relationlist.map(
                      (val) {
                        return DropdownMenuItem<String>(
                          value: val,
                          child: Text(
                            val,
                            style: TextStyle(
                                fontSize: wt / 26,
                                height: 1,
                                color: fontColor,
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.w500),
                          ),
                        );
                      },
                    ).toList(),
                    onChanged: (val) {
                      setState(
                        () {
                          _dropDownRelationValue = val;
                          relation = val;
                        },
                      );
                    },
                  ),
                ),
              )
            ]));
  }

  Widget combo(String label, TextEditingController t, int i) {
    return Container(
        padding: EdgeInsets.all(4.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _buildLabel(label),
              _buildField(t, i),
            ]));
  }

  _savedData() {
    setState(() {
      i.fullNameC.text = fullname;
      //  i.dobC.text = dob;
      // i.nationalityC.text = national;

      i.phnnoC.text = phnno;
      //  i.genderC.text = gender;
      //  i.maritalC.text = marital;
      i.relationshipC.text = relation;
      //print("controller:" + i.fullNameC.text + "and" + fullname);
    });
  }

  Widget _buildHead() {
    return Text(
      "Emergency Contact",
      style: hst.copyWith(fontSize: wt / 19),
    );
  }

  Widget _buildLabel(String label) {
    return Text(label, style: lst.copyWith(fontSize: wt / 25));
  }

  Widget _buildField(TextEditingController c, int index) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      color: cardColor,
      child: Center(
        child: TextFormField(
          controller: c,
          showCursor: true,
          cursorColor: Colors.green[800],
          cursorWidth: 1,
          onChanged: (value) {
            setState(() {
              print("After changed" + c.text);
              if (index == 1) {
                fullname = value;
              } else if (index == 2) {
                phnno = value;
              }
              // = value;
            });
          },
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: wt / 26,
              height: 1,
              color: fontColor,
              letterSpacing: 0.5,
              fontWeight: FontWeight.w500),
          decoration: InputDecoration(
            suffixIcon: Icon(
              Icons.edit,
              size: 22,
              color: Colors.green[300],
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide.none),
          ),
        ),
      ),
    );
  }
}
