import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vdart/model/newsmodel.dart';
import 'package:vdart/screens/home/news/chatnews.dart';
import 'package:vdart/utils.dart/styles.dart';

class NewsContent extends StatefulWidget {
  NewsModel data;
  NewsContent({this.data});
  @override
  _NewsContent createState() => _NewsContent();
}

class _NewsContent extends State<NewsContent> with TickerProviderStateMixin {
  final List<Msg> _messages = <Msg>[];
  final TextEditingController _textController = new TextEditingController();
  bool _isWriting = false;

  String defaultUserName = "John Doe";
  double ht, wt;
  bool chat = false;
  @override
  Widget build(BuildContext context) {
    ht = MediaQuery.of(context).size.height;
    wt = MediaQuery.of(context).size.width;
    var st = TextStyle(
        fontSize: wt / 15,
        color: fontColor,
        letterSpacing: 0.5,
        fontWeight: FontWeight.w700);
    return MaterialApp(
        title: "Grove",
        debugShowCheckedModeBanner: false,
        color: Colors.white,
        home: Scaffold(
          bottomSheet: !chat
              ? Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.thumb_up,
                              size: 25,
                              color: Colors.blueGrey,
                            ),
                            onPressed: () {
                              //like
                            },
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.chat,
                              size: 25,
                              color: Colors.blueGrey,
                            ),
                            onPressed: () {
                              //chat
                              setState(() {
                                chat = !chat;
                              });
                              // _buildComposer();
                            },
                          )
                        ],
                      )),
                      Text(widget.data.newslike.toString()) //no of likes
                    ],
                  ),
                )
              : null,
          body: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                Container(
                    padding: EdgeInsets.all(10.0),
                    height: wt / 4,
                    //color: Colors.red,
                    width: wt,
                    child: Row(children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(3.0),
                        child: InkWell(
                          child: Image.asset('assets/images/arrowl.png',
                              height: 20, width: 20),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "News",
                        style: st,
                      )
                    ])),
                Padding(
                    padding: EdgeInsets.all(2),
                    child: Container(
                        height: ht,
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: SingleChildScrollView(
                              child: Padding(
                                  padding: EdgeInsets.all(6.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.all(7.0),
                                        child: _title(widget.data.newstitle),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(7.0),
                                        child: _date(
                                            widget.data.newsdate.toString()),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(7.0),
                                        child: _subtitle("Purpose and Scope"),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(7.0),
                                        child: _content(
                                            "The purpose of this plicy is to set out the company's position on taking annual leave."),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(7.0),
                                        child:
                                            _subtitle("Company Holiday Year"),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(7.0),
                                        child: _content(
                                            "The Company's holiday year runs from 1 January to 31 December"),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(7.0),
                                        child: _subtitle(
                                            "Annual Leave Entitlement"),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(7.0),
                                        child: _content(
                                            "Your annual leave entitlement is confirmed in your contract of employment."),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(7.0),
                                        child: _draw(),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Text(
                                              _messages.length.toString() +
                                                  "Comment",
                                              style: TextStyle(
                                                  fontSize: wt / 18,
                                                  color: Colors.grey[400]))),
                                      _messages.length > 0
                                          ? Container(
                                              height: wt / 2,
                                              child: ListView.builder(
                                                itemBuilder: (_, int index) =>
                                                    _messages[index],
                                                itemCount: _messages.length,
                                                reverse: true,
                                                padding:
                                                    new EdgeInsets.all(6.0),
                                              ),
                                            )
                                          : Container(height: 1),
                                      // new Divider(height: 1.0),
                                      Container(
                                          child: chat ? _buildchat() : null)
                                    ],
                                  ))),
                        )))
              ])),
        ));
  }

  _buildchat() {
    return Container(
      child: _buildComposer(),
    );
  }

  _title(String title) {
    return Text(title,
        style: TextStyle(
            fontSize: wt / 20, color: fontColor, fontWeight: FontWeight.w600));
  }

  _date(String date) {
    return Text(date,
        style: TextStyle(
            color: Colors.green[400],
            fontSize: wt / 29,
            fontWeight: FontWeight.bold));
  }

  _subtitle(String s) {
    return Text(s,
        style: TextStyle(fontSize: wt / 25, fontWeight: FontWeight.bold));
  }

  _content(String s) {
    return Text(
      s,
      style: TextStyle(fontSize: wt / 25),
    );
  }

  _draw() {
    return Container(
      height: 1,
      width: wt / 1.2,
      color: Colors.grey[200],
    );
  }

  Widget _buildComposer() {
    return new IconTheme(
      data: new IconThemeData(color: Theme.of(context).accentColor),
      child: new Container(
          margin: const EdgeInsets.symmetric(horizontal: 9.0),
          child: new Row(
            children: <Widget>[
              new Flexible(
                child: new Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    cursorColor: fontColor,
                    controller: _textController,
                    onChanged: (String txt) {
                      setState(() {
                        _isWriting = txt.length > 0;
                      });
                    },
                    onSubmitted: _submitMsg,
                    decoration: new InputDecoration.collapsed(
                        hintText: "Write your comment",
                        hintStyle: TextStyle(
                            fontSize: wt / 26,
                            color: Colors.grey[400],
                            fontWeight: FontWeight.w500)),
                  ),
                ),
              ),
              new Container(
                  margin: new EdgeInsets.symmetric(horizontal: 3.0),
                  child: Theme.of(context).platform == TargetPlatform.iOS
                      ? new CupertinoButton(
                          child: new Text("Submit"),
                          onPressed: _isWriting
                              ? () => _submitMsg(_textController.text)
                              : null)
                      : new IconButton(
                          icon: new Icon(
                            Icons.send,
                            color: Colors.green[400],
                          ),
                          onPressed: _isWriting
                              ? () {
                                  _submitMsg(_textController.text);
                                  setState(() {
                                    // chat = !chat;
                                  });
                                }
                              : null,
                        )),
            ],
          ),
          decoration: Theme.of(context).platform == TargetPlatform.iOS
              ? new BoxDecoration(
                  border: new Border(top: new BorderSide(color: Colors.brown)))
              : null),
    );
  }

  void _submitMsg(String txt) {
    _textController.clear();
    setState(() {
      _isWriting = false;
    });
    Msg msg = new Msg(
      txt: txt,
      animationController: new AnimationController(
          vsync: this, duration: new Duration(milliseconds: 800)),
    );
    setState(() {
      _messages.insert(0, msg);
    });
    msg.animationController.forward();
  }

  @override
  void dispose() {
    for (Msg msg in _messages) {
      msg.animationController.dispose();
    }
    super.dispose();
  }
}
