import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vdart/model/dependentmodel.dart';
import 'package:vdart/screens/home/Dependent/dependentcard.dart';
import 'package:vdart/screens/home/Dependent/viewdependentcard.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBar createState() => _SearchBar();
}

class _SearchBar extends State<SearchBar> {
  TextEditingController searchController = TextEditingController();
  List<DependentModel> dlist = [];
  bool isSearchEmpty = true;
  double ht, wt;
  @override
  void initState() {
    getDependentfromDB();
  }

  getDependentfromDB() async {
    print("Entered setNotes");
    var fetchedData = await getDataFromDB();
    setState(() {
      dlist = fetchedData;
      print(dlist);
      dlist.forEach((element) {
        print(element.dname);
      });
    });
  }

  Future<List<DependentModel>> getDataFromDB() async {
    List<DependentModel> d = [];
    var maps = [
      {
        'dname': 'Angeline Beier',
        'drole': 'Finance Manager',
        'dmob': '0978412176',
        'demail': 'angeline.beier@grovehr.com',
        'dlinemanager': 'Karthika velmurugan',
        'joinDate': DateTime.now(),
        'durl': null
      },
      {
        'dname': 'Brisa Roob',
        'drole': 'Finance Manager',
        'dmob': '0978412176',
        'demail': 'angeline.beier@grovehr.com',
        'dlinemanager': 'Karthika velmurugan',
        'joinDate': DateTime.now(),
        'durl': null
      },
      {
        'dname': 'Chao Lian',
        'drole': 'Finance Manager',
        'dmob': '0978412176',
        'demail': 'angeline.beier@grovehr.com',
        'dlinemanager': 'Karthika velmurugan',
        'joinDate': DateTime.now(),
        'durl': null
      },
      {
        'dname': 'Delphia Feil',
        'drole': 'Finance Manager',
        'dmob': '0978412176',
        'demail': 'angeline.beier@grovehr.com',
        'dlinemanager': 'Karthika velmurugan',
        'joinDate': DateTime.now(),
        'durl': null
      },
      {
        'dname': 'Ettie Dicki',
        'drole': 'Finance Manager',
        'dmob': '0978412176',
        'demail': 'angeline.beier@grovehr.com',
        'dlinemanager': 'Karthika velmurugan',
        'joinDate': DateTime.now(),
        'durl': null
      },
      {
        'dname': 'Heng Wei',
        'drole': 'Finance Manager',
        'dmob': '0978412176',
        'demail': 'angeline.beier@grovehr.com',
        'dlinemanager': 'Karthika velmurugan',
        'joinDate': DateTime.now(),
        'durl': null
      },
      {
        'dname': 'Heng Wei',
        'drole': 'Finance Manager',
        'dmob': '0978412176',
        'demail': 'angeline.beier@grovehr.com',
        'dlinemanager': 'Karthika velmurugan',
        'joinDate': DateTime.now(),
        'durl': null
      },
      {
        'dname': 'Heng Wei',
        'drole': 'Finance Manager',
        'dmob': '0978412176',
        'demail': 'angeline.beier@grovehr.com',
        'dlinemanager': 'Karthika velmurugan',
        'joinDate': DateTime.now(),
        'durl': null
      },
      {
        'dname': 'Heng Wei',
        'drole': 'Finance Manager',
        'dmob': '0978412176',
        'demail': 'angeline.beier@grovehr.com',
        'dlinemanager': 'Karthika velmurugan',
        'joinDate': DateTime.now(),
        'durl': null
      },
    ];
    if (maps.length > 0) {
      maps.forEach((map) {
        d.add(DependentModel.fromMap(map));
      });
    }
    return d;
  }

  @override
  Widget build(BuildContext context) {
    ht = MediaQuery.of(context).size.height;
    wt = MediaQuery.of(context).size.width;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Grove",
        color: Colors.white,
        home: Scaffold(
            backgroundColor: Colors.white,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(80),
              child: Padding(
                  padding: EdgeInsets.only(left: 3, right: 3),
                  child: Container(
                    height: wt / 4,
                    child: Card(
                        color: Colors.white,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: Container(
                          padding: EdgeInsets.only(top: 20, left: 3, right: 3),
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
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(left: 8),
                                  padding: EdgeInsets.only(left: 16),
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.blueGrey.shade50,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(Icons.search,
                                          size: 30,
                                          color: Colors.blueGrey[800]),
                                      Expanded(
                                        child: TextField(
                                          controller: searchController,
                                          maxLines: 1,
                                          onChanged: (value) {
                                            handleSearch(value);
                                          },
                                          autofocus: false,
                                          cursorColor: Colors.blueGrey[400],
                                          keyboardType: TextInputType.text,
                                          style: TextStyle(
                                              fontSize: wt / 26,
                                              fontWeight: FontWeight.w400),
                                          textInputAction:
                                              TextInputAction.search,
                                          decoration: InputDecoration.collapsed(
                                            hintText: 'Search people',
                                            hintStyle: TextStyle(
                                                color: Colors.blueGrey[400],
                                                fontSize: wt / 24,
                                                fontWeight: FontWeight.w400),
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        icon: Icon(
                                            !isSearchEmpty ? Icons.close : null,
                                            size: 26,
                                            color: Colors.blueGrey[400]),
                                        onPressed: cancelSearch,
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        )),
                  )),
            ),
            body: Padding(
                padding: EdgeInsets.all(9.0),
                child: ListView(children: <Widget>[
                  ..._buildDependentList(),
                ]))));
  }

  List<Widget> _buildDependentList() {
    List<Widget> dataComponentsList = [];
    dlist.sort((a, b) {
      return a.dname.compareTo(b.dname);
    });
    if (searchController.text.isNotEmpty) {
      dlist.forEach((data) {
        if (data.dname
                .toLowerCase()
                .contains(searchController.text.toLowerCase()) ||
            data.drole
                .toLowerCase()
                .contains(searchController.text.toLowerCase()))
          dataComponentsList.add(DependentCardComponent(
            data: data,
            onTapAction: openCardToRead,
          ));
      });
      return dataComponentsList;
    } else {
      dlist.forEach((data) {
        dataComponentsList.add(DependentCardComponent(
          data: data,
          onTapAction: openCardToRead,
        ));
      });
    }
    return dataComponentsList;
  }

  openCardToRead(DependentModel data) async {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ViewDependentCard(data: data)));
    /* setState(() {
      headerShouldHide = true;
    });*/
    /*  await Future.delayed(Duration(milliseconds: 230), () {});
    Navigator.push(
        context,
        FadeRoute(
            page: ViewNotePage(
                triggerRefetch: refetchNotesFromDB, currentNote: noteData)));
    await Future.delayed(Duration(milliseconds: 300), () {});*/

    /* setState(() {
      headerShouldHide = false;
    });*/
  }

  void handleSearch(String value) {
    if (value.isNotEmpty) {
      setState(() {
        isSearchEmpty = false;
      });
    } else {
      setState(() {
        isSearchEmpty = true;
      });
    }
  }

  void cancelSearch() {
    FocusScope.of(context).requestFocus(new FocusNode());
    setState(() {
      searchController.clear();
      isSearchEmpty = true;
    });
  }
}
