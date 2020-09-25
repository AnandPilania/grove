import 'package:flutter/material.dart';
import 'package:vdart/model/newsmodel.dart';
import 'package:vdart/screens/home/Dependent/searchbar.dart';
import 'package:vdart/screens/home/news/viewsearchnewscard.dart';
import 'package:vdart/screens/profile/profile.dart';
import 'package:vdart/utils.dart/styles.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  List<NewsModel> newslist = [];
  double ht, wt;
  @override
  void initState() {
    getNewsfromDB();
  }

  getNewsfromDB() async {
    print("Entered News");
    var fetchedData = await getDataFromDB();
    setState(() {
      newslist = fetchedData;
      print(newslist);
      newslist.forEach((element) {
        print(element.newstitle);
      });
    });
  }

  Future<List<NewsModel>> getDataFromDB() async {
    List<NewsModel> d = [];
    var maps = [
      {
        'newstitle': 'Annual Leave Policy',
        'newslike': 0,
        'newsdate': DateTime.now()
      },
      {
        'newstitle': 'Use of Company Ploicy',
        'newslike': 0,
        'newsdate': DateTime.now()
      },
      {
        'newstitle': 'Promotion Announcement',
        'newslike': 0,
        'newsdate': DateTime.now()
      },
      {
        'newstitle': 'Annual Leave Policy',
        'newslike': 0,
        'newsdate': DateTime.now()
      },
      {
        'newstitle': 'Annual Leave Policy',
        'newslike': 0,
        'newsdate': DateTime.now()
      }
    ];
    if (maps.length > 0) {
      maps.forEach((map) {
        d.add(NewsModel.fromMap(map));
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
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(65),
              child: Padding(
                padding: EdgeInsets.only(left: 3.0, right: 3.0),
                child: Container(
                  child: Card(
                      elevation: 20,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: Container(
                        height: wt * 1.5,
                        padding: EdgeInsets.only(
                            top: 25, left: 10, right: 10, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              height: wt / 8,
                              padding: EdgeInsets.all(5.0),
                              // width: wt / 2,
                              //color: Colors.blueGrey[100],
                              child: InkWell(
                                onTap: () {
                                  //navigate to search page
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SearchBar()));
                                },
                                child: Container(
                                  height: 10,
                                  child: Material(
                                      color: Colors.grey[200],
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.all(6.0),
                                            child: Icon(
                                              Icons.search,
                                              size: 33,
                                              color: Colors.blueGrey[800],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 4,
                                          ),
                                          Padding(
                                              padding: EdgeInsets.all(6.0),
                                              child: Text(
                                                "Search people Wed,23 Sep",
                                                style: TextStyle(
                                                    color: Colors.blueGrey,
                                                    fontSize: wt / 29,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ))
                                        ],
                                      )),
                                ),
                              ),
                            ),
                            InkWell(
                              child: CircleAvatar(
                                backgroundColor: Colors.grey[200],
                                child: Icon(
                                  Icons.person,
                                  color: Colors.white,
                                ),
                                radius: 18,
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Profile()));
                              },
                            )
                          ],
                        ),
                      )),
                ),
              ),
            ),
            backgroundColor: bgcolor,
            body: Padding(
              padding: EdgeInsets.all(4.0),
              child: ListView(
                padding: EdgeInsets.all(4.0),
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 15.0),
                    child: _welcomeCard(),
                  ),
                  ..._buildNewsCard(),
                ],
              ),
            )));
  }

  List<Widget> _buildNewsCard() {
    List<Widget> dataComponentsList = [];
    newslist.sort((a, b) {
      return a.newsdate.compareTo(b.newsdate);
    });

    newslist.forEach((data) {
      dataComponentsList.add(NewsCard(
        data: data,
        onTapAction: _openNewsCard,
      ));
    });

    return dataComponentsList;
  }

  _openNewsCard(NewsModel data) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ViewNewsSearchBar()));
  }

  _welcomeCard() {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      overflow: Overflow.visible,
      children: <Widget>[
        Container(
            height: wt / 2.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [0.1, 0.5, 0.7, 0.9],
                colors: [
                  Colors.green[800],
                  Colors.green[700],
                  Colors.green[600],
                  Colors.green[400],
                ],
              ),
            ),
            child: Center(
              child: Padding(
                  padding: EdgeInsets.all(25.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                            "Welcome aboard! It is a great honour to have you in our team",
                            style: TextStyle(
                                fontSize: wt / 24,
                                color: Colors.white,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w600)),
                        Text("13 Sep 2020",
                            style: TextStyle(
                                fontSize: wt / 30,
                                color: Colors.white70,
                                fontWeight: FontWeight.w500))
                      ])),
            )),
        Positioned(
            top: -30,
            left: wt / 2.9,
            child: CircleAvatar(
              radius: 28,
              backgroundColor: Colors.white,
              child:
                  Icon(Icons.star_border, size: 29, color: Colors.green[400]),
            ))
      ],
    );
  }
}

class NewsCard extends StatelessWidget {
  const NewsCard({
    this.data,
    this.onTapAction,
    Key key,
  }) : super(key: key);

  final NewsModel data;
  final Function(NewsModel data) onTapAction;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    double ht = size.height;
    double wt = size.width;
    return InkWell(
        onTap: () {
          onTapAction(data);
        },
        child: Container(
            height: wt / 2.6,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "News",
                            style: TextStyle(
                                color: Colors.green[400],
                                fontSize: wt / 28,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            data.newsdate.toString(),
                            style: TextStyle(
                                color: Colors.green[400],
                                fontSize: wt / 30,
                                fontWeight: FontWeight.w300),
                          )
                        ],
                      )),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      data.newstitle,
                      style: TextStyle(fontSize: wt / 25, letterSpacing: 1),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                IconButton(
                                    icon: Icon(Icons.thumb_up,
                                        color: Colors.blueGrey, size: 20),
                                    onPressed: () {}),
                                IconButton(
                                  icon: Icon(Icons.chat,
                                      color: Colors.blueGrey, size: 20),
                                  onPressed: () {},
                                )
                              ]),
                          //add  if no of likes
                          data.newslike > 0
                              ? Text(data.newslike.toString())
                              : Text("")
                        ],
                      )),
                ],
              ),
            )));
  }
}
