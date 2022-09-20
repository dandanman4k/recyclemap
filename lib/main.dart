import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'nextpage.dart';

void main() async => runApp(GetMaterialApp(home: Home(),debugShowCheckedModeBanner: false));

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);


  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<Home> {
  int index = 0;

  List<String> themes = ["Sean","New","MyEyes","Acid"];
  String selectedValue = "Sean";


  List<Color> colour0 = [Color(0xff51557E), Color(0xff0C4271), Color(0xff006C9A),Color(0xffF94C66)];///////BackGround
  List<Color> colour1 = [Color(0xff816797), Color(0xffB25068), Color(0xff9FF9C1),Color(0xffBD4291)];///////Button
  List<Color> colour2 = [Color(0xffD6D5A8), Color(0xffF9DFDC), Color(0xff00F3E4),Color(0xff53BF9D)];///////Text


  var lon;
  var lat;


  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }


  @override
  Widget build(context) {

    return Scaffold(

      backgroundColor: colour0[index],
      body:
      new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            DropdownButton<String>(
                value: selectedValue,
                items: List.generate(
                    themes.length,
                        (index1) => DropdownMenuItem(
                        value: themes[index1], child: Text(themes[index1],
                          style: new TextStyle(
                              color: colour2[index],
                              fontWeight: FontWeight.w300,
                              fontFamily: "Poppins"
                          ),
                        ))),
                onChanged: (newvalue) {
                  if (newvalue != null) {
                    selectedValue = newvalue;
                  }
                  setState(() {
                    index = themes.indexOf(selectedValue);
                  });
                },
                dropdownColor: colour1[index]
                ),


            Padding(
              padding: const EdgeInsets.all(10.0),
              child: new Image.asset(
                'assets/logo.png',
                fit:BoxFit.cover,
                width: 200.0,
                height: 200.0,
              ),
            ),

            new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Text(
                    "Your Location Is",
                    style: new TextStyle(fontSize:32.0,
                        color: colour2[index],
                        fontWeight: FontWeight.w300,
                        fontFamily: "Poppins"
                    ),
                  )
                ]

            ),

            new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  FittedBox(
                      fit: BoxFit.fitWidth,
                      child: new Text(
                        lon.toString()+","+lat.toString(),
                        style: new TextStyle(fontSize:28.0,
                            color: colour2[index],
                            fontWeight: FontWeight.w400,
                            fontFamily: "Poppins"
                        ),
                      )
                  ),
                ]

            ),

            new Padding(
              child:
              new RaisedButton(key:null, onPressed: () async{
                Position position = await _determinePosition();
                setState(() {
                  lat = position.latitude;
                  lon = position.longitude;
                });
                },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: colour1[index],
                  child:
                  new Text(
                    "Get Location",
                    style: new TextStyle(fontSize:28.0,
                        color: colour2[index],
                        fontWeight: FontWeight.w300,
                        fontFamily: "Poppins"
                    ),
                  )
              ),
              padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
            ),

            new Padding(
              child:
              new RaisedButton(key:null, onPressed: (){
                Get.to(nextpage(), arguments: [colour0[index],colour1[index],colour2[index],lat,lon]);
              },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: colour1[index],
                  child:
                  new Text(
                    "Next",
                    style: new TextStyle(fontSize:28.0,
                        color: colour2[index],
                        fontWeight: FontWeight.w300,
                        fontFamily: "Poppins"
                    ),
                  )
              ),
              padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
            ),


          ]),

    );
  }
}


