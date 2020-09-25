import 'package:flutter/material.dart';
import 'package:vdart/model/newsmodel.dart';

class NewsCardComponent extends StatelessWidget {
  const NewsCardComponent({
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
            height: wt / 2.5,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 20, top: 2),
                    child: Text(
                      data.newstitle,
                      style: TextStyle(
                          fontSize: wt / 25,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 20, top: 2),
                      child: Text(
                        data.newsdate.toString(),
                        style: TextStyle(
                            color: Colors.green[400],
                            fontSize: wt / 28,
                            fontWeight: FontWeight.w500),
                      )),
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
