import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Log extends StatefulWidget {
  @override
  _Log createState() => _Log();
}

class _Log extends State<Log> with SingleTickerProviderStateMixin {
  GlobalKey<FormState> _key = GlobalKey();

  final int delayedAmount = 500;

  AnimationController _controller;

  bool _validaten = false;
  bool _validatep = false;
  String _platformImei = 'Unknown';
  String uniqueId = "Unknown";
  FocusNode namefocusnode, pwdfocusnode;
  TextEditingController nameController = TextEditingController();
  TextEditingController pwdController = TextEditingController();

  String sname, pass;
  var toastText;

/*
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final Location location = Location();
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;

  var sessionToken = '';
  String lat, long;
  String firebaseToken;
  getLocation() async {
    _permissionGranted = await location.hasPermission();
    print("Permission status:");
    print(_permissionGranted);
//toast(context, "Permission Status :$_permissionGranted");
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
      if (_permissionGranted == PermissionStatus.granted) {
        return;
      }
    }
    print("permisision status:");
    print(_permissionGranted);
//toast(context, "Permission Status :$_permissionGranted");
    if (_permissionGranted == PermissionStatus.granted) {
      _serviceEnabled = await location.serviceEnabled();
      print("SeevicEnabled:");
      print(_serviceEnabled);
//toast(context,"Service enabled status: $_serviceEnabled");
      if (!_serviceEnabled) {
        _serviceEnabled = await location.requestService();
        if (!_serviceEnabled) {
          //showLocation(context);
          print("after request press nothanks!!");
          print(_serviceEnabled);
          if (_serviceEnabled == false) {
            showLocation(context);
            print("showlocationok:");
            print(showlocationok);
          }

          return;
        }
      }
    } else {
      toast(
          context, "This app requires Location services!! \n Kindly Allow it!");
      getLocation();
    }

    _locationData = await location.getLocation();
    print(_locationData.latitude);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('latitude', _locationData.latitude.toString());
    prefs.setString('longitude', _locationData.longitude.toString());

    return;
  }

  Future<http.Response> _postRequest() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("\n\nMy contribution is:" + prefs.getString('contribution'));
    Map data = {
      'name': prefs.getString('name'),
      'mobile': prefs.getString('mobno'),
      'address': prefs.getString('address'),
      'state': prefs.getString('state'),
      'district': prefs.getString('district'),
      'professional': prefs.getString('professional'),
      'device_latitude': prefs.getString('latitude'),
      'device_longitude': prefs.getString('longitude'),
      'email': prefs.getString('email'),
      'profileUrl': prefs.getString('url'),
      'deviceType': 'mobile',
      'firebaseToken': firebaseToken,
      'contribution': prefs.getString('contribution'),
      'imei': prefs.getString('imei'),
    };
    //encode Map to JSON
    //String body = json.encode(data);
    var sendResponse = await http.post(
        'https://api.savemynation.com/api/partner/savepartner/registervolunteer',
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
        body: data,
        encoding: Encoding.getByName("gzip"));
    print('result');
    sessionToken = json.decode(sendResponse.body)['deviceToken'];
    print(sessionToken);
    //toast(context,"Sessiontoken : $sessionToken");
    prefs.setString('stoken', sessionToken);

    print(firebaseToken);
    //toast(context,"Firebasetoen is :$firebaseToken");

    setState(() {
      print(sendResponse.body);
    });
    return sendResponse;
  }

  firebaseCloudMessaging() async {
    String token = await _firebaseMessaging.getToken();

    firebaseToken = token;
  }

  Future<String> getSWData() async {
    var res = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
    var resBody = json.decode(res.body)['state'];
    print(resBody);
    List<String> tags = resBody != null ? List.from(resBody) : null;
    setState(() {
      sdata = tags;
    });
    return "Sucess";
  }

  Future<http.Response> postDTRequest() async {
    Map data = {'state': state};
    print("ok");
    var response = await http.post(durl,
        headers: {'Content-Type': "application/x-www-form-urlencoded"},
        body: data,
        encoding: Encoding.getByName("gzip"));
    var reBody = json.decode(response.body)['district'];
    print(reBody);
    List<String> dtags = reBody != null ? List.from(reBody) : null;
    setState(() {
      disdata = dtags;
    });
    return response;
  }
*/
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });

    //  initPlatformState();
    // checkingnet(context);
    /*if (checknet == 'connected') {
      this.getSWData();
    } else {
      shownet(context);
    }*/

    namefocusnode = FocusNode();
    pwdfocusnode = FocusNode();
    //  firebaseCloudMessaging();
  }

  /*Future<void> initPlatformState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String platformImei = 'unknown';
    String saveimei = 'unknown';

    String idunique = 'unknown';
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformImei =
          await ImeiPlugin.getImei(shouldShowRequestPermissionRationale: false);
      idunique = await ImeiPlugin.getId();
    } on PlatformException {
      platformImei = "Failed to get platform version";
      toast(context,
          "This App requires phone/call management!!\nKindly allow it");
      initPlatformState();
    }

    if (!mounted) return;

    setState(() {
      print(idunique);
      _platformImei = platformImei;
      uniqueId = idunique;
      saveimei = uniqueId;
      prefs.setString('imei', saveimei);
      print(_platformImei);
    });
  }
*/
  @override
  void dispose() {
    namefocusnode.dispose();
    pwdfocusnode.dispose();
    super.dispose();
  }

  double wt, ht;
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    wt = queryData.size.width;
    ht = queryData.size.height;

    return MaterialApp(
        title: "HR APP",
        debugShowCheckedModeBanner: false,
        color: Colors.white,
        home: Scaffold(
            body: Material(
          child: Container(
            height: ht,
            width: wt,
            padding: EdgeInsets.only(bottom: 5),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(height: ht / 13),
                  Container(
                      padding: EdgeInsets.all(3.0),
                      height: ht / 4.7,
                      width: wt / 3,
                      child: Column(
                        children: <Widget>[
                          FlutterLogo(
                            size: 100,
                          ),
                          SizedBox(height: 2),
                          //  Expanded(child: Text("Grove", style: onboardingtitle))
                        ],
                      )),
                  welcomeTextRow(wt, ht),
                  //     signInTextRow(wt),
                  SizedBox(
                    height: ht / 10,
                  ),
                  form(),
                  /* _page == 1
                      ? DelayedAnimation(
                          child: form(), delay: delayedAmount + 4000)
                      : form1(),
                  SizedBox(height: ht / 12),
                  // DelayedAnimation(child: button(), delay: delayedAmount + 5000),*/
                ],
              ),
            ),
          ),
        )));
  }

  Widget welcomeTextRow(double wt, double ht) {
    return Container(
      margin: EdgeInsets.only(left: wt / 20, top: ht / 100),
      child: Row(
        children: <Widget>[
          Text(
            "SignIn",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF6F35A5),
                fontSize: wt / 18 //_large? 60 : (_medium? 50 : 40),
                ),
          ),
        ],
      ),
    );
  }

  /* Widget signInTextRow(double wt) {
    return Center(
        child: Container(
      margin: EdgeInsets.only(left: wt / 15.0),
      child: Row(
        children: <Widget>[
          Text(
            "Personal Details",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color(0xFF6F35A5),
                fontWeight: FontWeight.w600,
                fontSize: wt / 25 // _large? 20 : (_medium? 17.5 : 15),
                ),
          ),
        ],
      ),
    ));
  }*/

  Widget form() {
    return Container(
        padding: EdgeInsets.all(25.0),
        //  margin: EdgeInsets.all(1.0),
        child: Card(
          key: _key,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
          elevation: 10,
          shadowColor: Color(0xFF6F35A5),
          child: Container(
            padding: EdgeInsets.all(7.0),
            child: Column(
              children: <Widget>[
                //name
                nameTextFormField(),
                //mobile
                pwdTextFormField(),
                Padding(
                  padding: EdgeInsets.all(6.0),
                  child: button(),
                )
              ],
            ),
          ),
        ));
  }

  Widget nameTextFormField() {
    return TextFormField(
      onChanged: (value) {
        sname = value;
      },
      focusNode: namefocusnode,
      onFieldSubmitted: (String value) {
        //   namefocusnode.unfocus();
        pwdfocusnode.requestFocus();
      },
      style: TextStyle(
          fontSize: wt / 30,
          color: Colors.black,
          letterSpacing: 1,
          fontWeight: FontWeight.w600),
      controller: nameController,
      keyboardType: TextInputType.text,
      cursorColor: Color(0xFF6F35A5),
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person, color: Color(0xFF6F35A5), size: 25),
        hintText: "User Name",
        hintStyle: TextStyle(fontSize: wt / 30),
        errorText:
            _validaten ? 'Name must contains atleast 4 characters' : null,
        errorStyle: TextStyle(
          fontSize: wt / 33,
          color: Colors.black45,
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide.none),
      ),
    );
  }

  Widget pwdTextFormField() {
    return TextFormField(
      onChanged: (value) {
        pass = value;
      },
      focusNode: pwdfocusnode,
      onFieldSubmitted: (String value) {
        pwdfocusnode.unfocus();
        //  mobilefocusnode.requestFocus();
      },
      style: TextStyle(
          fontSize: wt / 30,
          color: Colors.black,
          letterSpacing: 1,
          fontWeight: FontWeight.w600),
      controller: pwdController,
      keyboardType: TextInputType.visiblePassword,
      cursorColor: Color(0xFF6F35A5),
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.call, color: Color(0xFF6F35A5), size: 25),
        hintText: "Password",
        hintStyle: TextStyle(fontSize: wt / 30),
        errorText: _validatep ? 'Invalid Password' : null,
        errorStyle: TextStyle(
          fontSize: wt / 33,
          color: Colors.black45,
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide.none),
      ),
    );
  }

  Widget button() {
    return RaisedButton(
        onPressed: () async {
          /*  _locationData = await location.getLocation();
            print(_locationData.latitude);
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setString('latitude', _locationData.latitude.toString());
            prefs.setString('longitude', _locationData.longitude.toString());
            */

          setState(() {
            var f = 0;
            _validaten = false;
            _validatep = false;

            if (sname == null || sname.length < 4) {
              _validaten = true;

              f = 1;
            }
            if (pass == null || (pass.length < 6)) {
              _validatep = true;

              f = 1;
            }
            if (f == 0) {
              // toast(context, "Your $name and Mobile $mobno saved!");
              storeData();

              /*  Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegistrationForm1()),
              );*/
            }
          });
        },
        color: Colors.deepPurple,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
          child: Text(
            'Signin',
          ),
        ),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(40.0)),
        ));
  }

  storeData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      //    prefs.setString('sname',name);
      prefs.setString('email', pass);
      /* prefs.setString('url', imageUrl);
      prefs.setString('name', sname);
      prefs.setString('mobno', mobno);*/
    });
  }
}
