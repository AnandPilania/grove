import 'package:flutter/material.dart';
import 'package:vdart/screens/profile/infodata.dart';
import 'package:vdart/utils.dart/globals.dart';
import 'package:vdart/utils.dart/styles.dart';

class EditingPage extends StatefulWidget {
  @override
  _EditingPage createState() => _EditingPage();
}

class _EditingPage extends State<EditingPage> {
  String _dropDownNationalValue, _dropDownMaritalValue, _dropDownGenderValue;
  DateTime pickedDate;
  double ht, wt;
  List genderlist = ['Male', 'Female'];
  List maritallist = ['Single', 'Married'];
  List nationallist = [
    'Afghan',
    'Albanian',
    'Algerian',
    'American',
    'Andorran',
    'Angolan',
    'Anguillan',
    'Argentine',
    'Armenian',
    'Australian',
    'Azerbaijani',
    'Austrian',
    'Azerbaijani',
    'Bahamian',
    'Bahraini',
    'Bangladeshi',
    'Barbadian',
    'Belarusian',
    'Belgian',
    'Belizean'
  ];
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
  var hst = TextStyle(
      color: fontColor, letterSpacing: 1, fontWeight: FontWeight.w700);
  var lst = TextStyle(
      letterSpacing: 0.5,
      fontWeight: FontWeight.w500,
      color: Colors.blueGrey[400]);
  InfoData i = new InfoData();
  String fullname,
      dob,
      national,
      emailadd,
      phnno,
      gender,
      marital,
      personaltax,
      socialinsurane,
      healthinsurance;
  @override
  void initState() {
    //  i.data();
    //remodify the pickeddate value as from DB
    pickedDate = DateTime.now();
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
                            "Your information in Personal Info has been changed");
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
                    combo('First Name *', i.fullNameC, 1),
                    combo('Last Name *', i.fullNameC, 2),
                    // combo('Date of Birth', i.dobC, 3),
                    dobField('Date of Birth', 3),
                    chooseNationalDropBox('Nationality'),
                    //  combo('Nationality', i.nationalityC, 4),
                    combo('Email Address *', i.emailC, 5),
                    combo('Phone Number', i.phnnoC, 6),
                    chooseGenderDropBox('Gender'),
                    // combo('Gender', i.genderC, 7),
                    chooseMaritalDropBox('Marital Status'),
                    // combo('Marital Status', i.maritalC, 7),
                    combo('Personal Tax ID', i.personaltax, 9),
                    combo('Social Insurance', i.socialInsurance, 10),
                    combo('Health Insurance', i.healthInsurance, 11),

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

  Widget chooseNationalDropBox(String label) {
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
                    underline: SizedBox(height: 5),
                    hint: _dropDownNationalValue == null
                        ? Center(
                            child: Text(
                            "Select Nationality",
                            style: TextStyle(
                                fontSize: wt / 26,
                                height: 1,
                                color: Colors.blueGrey[300],
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.w500),
                          ))
                        : Center(
                            child: Text(
                            _dropDownNationalValue,
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
                    items: nationallist.map(
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
                          _dropDownNationalValue = val;
                          national = val;
                        },
                      );
                    },
                  ),
                ),
              )
            ]));
  }

  Widget chooseGenderDropBox(String label) {
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
                    hint: _dropDownGenderValue == null
                        ? Center(
                            child: Text(
                            "Select Gender",
                            style: TextStyle(
                                fontSize: wt / 26,
                                height: 1,
                                color: Colors.blueGrey[300],
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.w500),
                          ))
                        : Center(
                            child: Text(
                            _dropDownGenderValue,
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
                    items: genderlist.map(
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
                          _dropDownGenderValue = val;
                          gender = val;
                        },
                      );
                    },
                  ),
                ),
              )
            ]));
  }

  Widget chooseMaritalDropBox(String label) {
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
                    hint: _dropDownMaritalValue == null
                        ? Center(
                            child: Text(
                            "Select Marital Status",
                            style: TextStyle(
                                fontSize: wt / 26,
                                height: 1,
                                color: Colors.blueGrey[300],
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.w500),
                          ))
                        : Center(
                            child: Text(
                            _dropDownMaritalValue,
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
                    items: maritallist.map(
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
                          _dropDownMaritalValue = val;
                          marital = val;
                        },
                      );
                    },
                  ),
                ),
              )
            ]));
  }

  Widget dobField(String label, int i) {
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
                      child: ListTile(
                    title: Center(
                      child: Text(
                        "${pickedDate.day} ${months[pickedDate.month - 1]} ${pickedDate.year}",
                        style: TextStyle(
                            fontSize: wt / 26,
                            height: 1,
                            color: fontColor,
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    trailing: Icon(
                      Icons.date_range,
                      size: 20,
                      color: Colors.green[300],
                    ),
                    onTap: _pickDate,
                  )))
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
    print("Current saved Data is:\n" +
        fullname +
        "\n" +
        dob +
        "\n" +
        national +
        "\n" +
        emailadd +
        "\n" +
        phnno +
        "\n" +
        gender +
        "\n" +
        marital +
        "\n" +
        personaltax +
        "\n" +
        socialinsurane +
        "\n" +
        healthinsurance);
    setState(() {
      i.fullNameC.text = fullname;
      //  i.dobC.text = dob;
      // i.nationalityC.text = national;
      i.emailC.text = emailadd;
      i.phnnoC.text = phnno;
      //  i.genderC.text = gender;
      //  i.maritalC.text = marital;
      i.personaltax.text = personaltax;
      i.socialInsurance.text = socialinsurane;
      i.healthInsurance.text = healthinsurance;

      //print("controller:" + i.fullNameC.text + "and" + fullname);
    });
  }

  Widget _buildHead() {
    return Text(
      "Personal Info",
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
                dob = value;
              } else if (index == 3) {
                national = value;
              } else if (index == 4) {
                emailadd = value;
              } else if (index == 5) {
                phnno = value;
              } else if (index == 6) {
                gender = value;
              } else if (index == 7) {
                marital = value;
              } else if (index == 8) {
                personaltax = value;
              } else if (index == 9) {
                socialinsurane = value;
              } else if (index == 10) {
                healthinsurance = value;
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

  _pickDate() async {
    DateTime date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDate: pickedDate,
    );
    if (date != null)
      setState(() {
        pickedDate = date;
      });
  }
}
