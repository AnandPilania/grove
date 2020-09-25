import 'package:flutter/material.dart';
import 'package:vdart/screens/profile/infodata.dart';
import 'package:vdart/utils.dart/globals.dart';
import 'package:vdart/utils.dart/styles.dart';

class JobEditingPage extends StatefulWidget {
  @override
  _JobEditingPage createState() => _JobEditingPage();
}

class _JobEditingPage extends State<JobEditingPage> {
  String _dropDownEStatusValue,
      _dropDownJobTitleValue,
      _dropDownDepartmentValue,
      _dropDownOfficeValue,
      _dropDownLineMValue,
      _dropDownETypeValue;
  DateTime pickedDatejoinDate,
      pickedDatePs,
      pickedDatePe,
      pickedDateCs,
      pickedDateCe;
  double ht, wt;
  List estatuslist = ['Ative', 'Onboarding', 'On Leave', 'Probationary'];
  List jobtitlelist = [
    'HR Manager',
    'Marketing Specialist',
    'Finance Manager',
    'Admin',
    'Account Executive',
    'IT Helpdesk',
    'Others'
  ];
  List deptlist = [
    'Tailermade',
    'HR',
    'Sales',
    'Operations',
    'Marketing',
    'IT',
    'Management',
    'Finance'
  ];

  List offlist = ['Tailermade'];
  List linelist = [
    'Angeline Beier',
    'Aoi Nakanishi',
    'Brisa Roob',
    'Chao Lian'
  ];
  List etypelist = ['Full-time', 'Part-time', 'Contractor', 'Freelancer'];

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
  String estatus,
      joindate,
      jobtitle,
      dept,
      office,
      linemanager,
      etype,
      pstart,
      pend,
      cstart,
      cend;
  @override
  void initState() {
    //  i.data();
    //remodify the pickeddate value as from DB
    pickedDatejoinDate = DateTime.now();
    pickedDatePs = DateTime.now();
    pickedDatePe = DateTime.now();
    pickedDateCs = DateTime.now();
    pickedDateCe = DateTime.now();
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
                            "Your information in Job Info has been changed");
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

                    chooseEstatusDropBox('Employee Status *'),

                    estatusField('Join Date *', 1),
                    chooseJobtitleDropBox('Job Title *'),
                    chooseDepartmentDropBox('Department *'),
                    chooseOfficeDropBox('Office *'),
                    chooselinemDropBox('Line Manager'),
                    chooseetypeDropBox('Employment Type *'),
                    psField('Probation Start Date', 2),
                    peField('Probation End Date', 3),
                    csField('Contract Start Date', 4),
                    ceField('Contract End Date', 5),

                    //  combo('Nationality', i.nationalityC, 4),

                    // combo('Marital Status', i.maritalC, 7),
                  ],
                ),
              ))
        ]))));
  }

  Widget chooseEstatusDropBox(String label) {
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
                    hint: _dropDownEStatusValue == null
                        ? Center(
                            child: Text(
                            "Select Employee Status",
                            style: TextStyle(
                                fontSize: wt / 26,
                                height: 1,
                                color: Colors.blueGrey[300],
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.w500),
                          ))
                        : Center(
                            child: Text(
                            _dropDownEStatusValue,
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
                    items: estatuslist.map(
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
                          _dropDownEStatusValue = val;
                          estatus = val;
                        },
                      );
                    },
                  ),
                ),
              )
            ]));
  }

  Widget chooseJobtitleDropBox(String label) {
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
                    hint: _dropDownJobTitleValue == null
                        ? Center(
                            child: Text(
                            "Select Job Title",
                            style: TextStyle(
                                fontSize: wt / 26,
                                height: 1,
                                color: Colors.blueGrey[300],
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.w500),
                          ))
                        : Center(
                            child: Text(
                            _dropDownJobTitleValue,
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
                    items: jobtitlelist.map(
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
                          _dropDownJobTitleValue = val;
                          jobtitle = val;
                        },
                      );
                    },
                  ),
                ),
              )
            ]));
  }

  Widget chooseDepartmentDropBox(String label) {
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
                    hint: _dropDownDepartmentValue == null
                        ? Center(
                            child: Text(
                            "Select Department",
                            style: TextStyle(
                                fontSize: wt / 26,
                                height: 1,
                                color: Colors.blueGrey[300],
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.w500),
                          ))
                        : Center(
                            child: Text(
                            _dropDownDepartmentValue,
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
                    items: deptlist.map(
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
                          _dropDownDepartmentValue = val;
                          dept = val;
                        },
                      );
                    },
                  ),
                ),
              )
            ]));
  }

  Widget chooseOfficeDropBox(String label) {
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
                    hint: _dropDownOfficeValue == null
                        ? Center(
                            child: Text(
                            "Select Office",
                            style: TextStyle(
                                fontSize: wt / 26,
                                height: 1,
                                color: Colors.blueGrey[300],
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.w500),
                          ))
                        : Center(
                            child: Text(
                            _dropDownOfficeValue,
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
                    items: offlist.map(
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
                          _dropDownOfficeValue = val;
                          office = val;
                        },
                      );
                    },
                  ),
                ),
              )
            ]));
  }

  Widget chooselinemDropBox(String label) {
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
                    hint: _dropDownLineMValue == null
                        ? Center(
                            child: Text(
                            "Select Line Manager",
                            style: TextStyle(
                                fontSize: wt / 26,
                                height: 1,
                                color: Colors.blueGrey[300],
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.w500),
                          ))
                        : Center(
                            child: Text(
                            _dropDownLineMValue,
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
                    items: linelist.map(
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
                          _dropDownLineMValue = val;
                          linemanager = val;
                        },
                      );
                    },
                  ),
                ),
              )
            ]));
  }

  Widget chooseetypeDropBox(String label) {
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
                    hint: _dropDownETypeValue == null
                        ? Center(
                            child: Text(
                            "Select Employee Type",
                            style: TextStyle(
                                fontSize: wt / 26,
                                height: 1,
                                color: Colors.blueGrey[300],
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.w500),
                          ))
                        : Center(
                            child: Text(
                            _dropDownETypeValue,
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
                    items: etypelist.map(
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
                          _dropDownETypeValue = val;
                          etype = val;
                        },
                      );
                    },
                  ),
                ),
              )
            ]));
  }

  Widget estatusField(String label, int i) {
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
                        "${pickedDatejoinDate.day} ${months[pickedDatejoinDate.month - 1]} ${pickedDatejoinDate.year}",
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
                    onTap: _pickDateES,
                  )))
            ]));
  }

  _savedData() {
    setState(() {
      //print("controller:" + i.fullNameC.text + "and" + fullname);
    });
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

  Widget csField(String label, int i) {
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
                        "${pickedDateCs.day} ${months[pickedDateCs.month - 1]} ${pickedDateCs.year}",
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
                    onTap: _pickDateCS,
                  )))
            ]));
  }

  Widget ceField(String label, int i) {
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
                        "${pickedDateCe.day} ${months[pickedDateCe.month - 1]} ${pickedDateCe.year}",
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
                    onTap: _pickDateCE,
                  )))
            ]));
  }

  Widget psField(String label, int i) {
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
                        "${pickedDatePs.day} ${months[pickedDatePs.month - 1]} ${pickedDatePs.year}",
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
                    onTap: _pickDatePS,
                  )))
            ]));
  }

  Widget peField(String label, int i) {
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
                        "${pickedDatePe.day} ${months[pickedDatePe.month - 1]} ${pickedDatePe.year}",
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
                    onTap: _pickDatePE,
                  )))
            ]));
  }

  _pickDateES() async {
    DateTime date = await showDatePicker(
        context: context,
        firstDate: DateTime(DateTime.now().year - 5),
        lastDate: DateTime(DateTime.now().year + 5),
        initialDate: pickedDatejoinDate);
    if (date != null)
      setState(() {
        pickedDatejoinDate = date;
      });
  }

  _pickDatePS() async {
    DateTime date = await showDatePicker(
        context: context,
        firstDate: DateTime(DateTime.now().year - 5),
        lastDate: DateTime(DateTime.now().year + 5),
        initialDate: pickedDatePs);
    if (date != null)
      setState(() {
        pickedDatePs = date;
      });
  }

  _pickDatePE() async {
    DateTime date = await showDatePicker(
        context: context,
        firstDate: DateTime(DateTime.now().year - 5),
        lastDate: DateTime(DateTime.now().year + 5),
        initialDate: pickedDatePe);
    if (date != null)
      setState(() {
        pickedDatePe = date;
      });
  }

  _pickDateCS() async {
    DateTime date = await showDatePicker(
        context: context,
        firstDate: DateTime(DateTime.now().year - 5),
        lastDate: DateTime(DateTime.now().year + 5),
        initialDate: pickedDateCs);
    if (date != null)
      setState(() {
        pickedDateCs = date;
      });
  }

  _pickDateCE() async {
    DateTime date = await showDatePicker(
        context: context,
        firstDate: DateTime(DateTime.now().year - 5),
        lastDate: DateTime(DateTime.now().year + 5),
        initialDate: pickedDateCe);
    if (date != null)
      setState(() {
        pickedDateCe = date;
      });
  }
}
