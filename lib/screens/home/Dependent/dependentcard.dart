import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vdart/model/dependentmodel.dart';
import 'package:vdart/utils.dart/styles.dart';

class DependentCardComponent extends StatelessWidget {
  const DependentCardComponent({
    this.data,
    this.onTapAction,
    Key key,
  }) : super(key: key);

  final DependentModel data;
  final Function(DependentModel data) onTapAction;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    double ht = size.height;
    double wt = size.width;
    String date = data.joinDate.day
        .toString(); // DateFormat.yMd().add_jm().format(noteData.date.t);

    return Column(children: <Widget>[
      ListTile(
        onTap: () {
          onTapAction(data);
        },
        dense: true,
        contentPadding: EdgeInsets.all(8.0),
        leading: CircleAvatar(
          radius: 20,
          backgroundColor: Colors.blueGrey[200],
          child: data.durl == null
              ? Icon(Icons.person, color: Colors.white, size: 23)
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
        ),
        title: Text(data.dname,
            style: TextStyle(
              color: fontColor,
              fontSize: wt / 26,
              fontWeight: FontWeight.w700,
            )),
        subtitle: Text(
          data.drole,
          style: TextStyle(
              fontSize: wt / 28,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.5),
        ),
        trailing: InkWell(
            onTap: () {
              //redriect to call
              launch("tel://" + data.dmob);
            },
            child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.blueGrey[200],
                child: Icon(
                  Icons.call,
                  size: 23,
                  color: Colors.white,
                ))),
      ),
      Padding(
          padding: EdgeInsets.all(2),
          child: Container(
            height: 1.5,
            width: wt,
            color: Colors.grey[200],
          ))
    ]);
  }
}
