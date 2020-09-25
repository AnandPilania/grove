import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vdart/screens/profile/infodata.dart';
import 'package:vdart/utils.dart/styles.dart';

class PersonalDoc extends StatefulWidget {
  @override
  _PersonalDoc createState() => _PersonalDoc();
}

class _PersonalDoc extends State<PersonalDoc> {
  double ht, wt;
  int _fileExist = 0;
  bool _loading = false;

  var hst = TextStyle(
      color: fontColor, letterSpacing: 1, fontWeight: FontWeight.w700);
  var lst = TextStyle(
      letterSpacing: 0.5,
      fontWeight: FontWeight.w500,
      color: Colors.blueGrey[400]);
  InfoData i = new InfoData();
  List fname = [];
  String fileName;
  String path;
  int ii;
  /* Map<String, String> _paths;
  String _extension;
  bool _loadingPath = false;
  bool _multiPick = false;
  bool _hasValidMime = false;
  FileType _pickingType;*/
  TextEditingController _controller = new TextEditingController();

  @override
  void initState() {
    //   i.data();
    print("Data is" + i.fullNameC.text);
    print("length is....." + fname.length.toString());
    if (fname.length > 0) {
      setState(() {
        print(fname.length.toString() + "length");
        _fileExist = fname.length;
      });
    } else {
      _fileExist = 0;
    }
    //  _controller.addListener(() => _extension = _controller.text);
  }

  void _openFile() async {
    // FilePickerResult result = await FilePicker.platform.pickFiles();
    FilePickerResult result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc'],
    );

    if (result != null) {
      // List<File> file1 = result.paths.map((path) => File(path));

//fileName  = file1[0].name;

      /*  File file = File(result.files.single.path);*/
      PlatformFile file1 = result.files.first;
      print(file1.name);
      fname.add(file1.name);
      print("List is ........." + fname.toString());
      print('List length is : ' + fname.length.toString());
      setState(() {
        _fileExist = fname.length;
      });
      fileName = file1.name;
      print(file1.bytes);
      print(file1.size);
      print(file1.extension);
      print(file1.path);
      path = file1.path;
    }
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Padding(
                                      padding: EdgeInsets.all(7.0),
                                      child: _buildHead()),
                                  Padding(
                                    padding: EdgeInsets.all(7.0),
                                    child: InkWell(
                                      onTap: () {
                                        _openFile();
                                      },
                                      child: Text(
                                        "UPLOAD",
                                        style: TextStyle(
                                            fontSize: wt / 22,
                                            color: Colors.green[400],
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                ])),
                        Container(
                            // color: Colors.red,
                            height: wt * 1.8,
                            width: wt,
                            child: _fileExist > 0
                                ? ListView.builder(
                                    itemCount: fname.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          elevation: 10,
                                          child: Container(
                                            height: wt / 6,
                                            width: wt,
                                            padding: EdgeInsets.all(5.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 10.0),
                                                  child: Text(
                                                    fname[index],
                                                    style: TextStyle(
                                                      color: fontColor,
                                                      fontSize: wt / 26,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                                IconButton(
                                                  icon: Icon(
                                                    Icons.close,
                                                    size: 25,
                                                    color: fontColor,
                                                  ),
                                                  onPressed: () {
                                                    //close the file
                                                    setState(() {
                                                      fname.removeAt(index);
                                                    });
                                                    print("Close file is :" +
                                                        fname[index]);
                                                  },
                                                )

                                                //  Text(path),
                                              ],
                                            ),
                                          ));
                                    })
                                : Container(
                                    child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(height: ht / 4),
                                      Container(
                                          height: 100,
                                          width: 100,
                                          child: Image.asset(
                                              'assets/images/nodoc.png')),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                          width: wt / 1.7,
                                          child: Padding(
                                              padding: EdgeInsets.all(4.0),
                                              child: Text(
                                                "There's no documents. Upload some to create one source of truth.",
                                                style: TextStyle(
                                                    fontSize: wt / 30,
                                                    color: Colors.blueGrey[200],
                                                    letterSpacing: 0.5,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              )))
                                    ],
                                  )))

                        /* Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    elevation: 10,
                                    child: Container(
                                      height: wt / 7,
                                      width: wt,
                                      padding: EdgeInsets.all(5.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.only(left: 4.0),
                                            child: Text(
                                              fname[index],
                                              style: TextStyle(
                                                color: fontColor,
                                                fontSize: wt / 28,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          IconButton(
                                            icon: Icon(
                                              Icons.close,
                                              size: 25,
                                              color: fontColor,
                                            ),
                                            onPressed: () {
                                              //close the file
                                            },
                                          )

                                          //  Text(path),
                                        ],
                                      ),
                                    ),
                                  );*/
                        //   })
                      ])))
        ]))));
  }

  Widget _buildHead() {
    return Text(
      "Personal Documents",
      style: hst.copyWith(fontSize: wt / 22),
    );
  }
}
