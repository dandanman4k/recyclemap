import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'logic.dart';


class nextpage extends StatefulWidget {
  const nextpage({Key? key}) : super(key: key);

  @override
  _nextpageState createState() => _nextpageState();
}

class _nextpageState extends State<nextpage> {

  photo(lat,lon) async{
    String link2 = await take_photo(lat,lon, int.parse(_Plactic_bottles.text));
    Get.back();
    return link2;
  }

  String link = "";
  TextEditingController _Plactic_bottles = TextEditingController();
  TextEditingController comments = TextEditingController();

  Color colour0 = Get.arguments[0];
  Color colour1 = Get.arguments[1];
  Color colour2 = Get.arguments[2];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colour0,
      body:  SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50.0),
                child: new Image.asset(
                  'assets/logo.png',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              new Text(
                "Plastic Bottles",
                style: new TextStyle(fontSize:22.0,
                    color: colour2,
                    fontWeight: FontWeight.w300,
                    fontFamily: "Poppins"),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,0,0,20),
                child: new TextField(
                  controller: _Plactic_bottles,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 150),
                    hintText: "Bottles",
                    border: UnderlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  style: new TextStyle(fontSize:20.0,
                      color: colour2,
                      fontWeight: FontWeight.w300,
                      fontFamily: "Poppins"),
                ),
              ),
              TextFormField(
                initialValue: '',
                style: TextStyle(color: colour2),
                decoration: InputDecoration(
                  labelText: 'Comments',
                  border: OutlineInputBorder(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,0,0,20),
                child: RaisedButton(
                  color: colour1,
                  onPressed: () {
                    var lon = Get.arguments[4];
                    var lat = Get.arguments[3];
                    link = photo(lat,lon);
                    },
                child:
                new Text(
                    "Take Photo & Upload",
                    style: new TextStyle(fontSize:23.0,
                        color: colour2,
                        fontWeight: FontWeight.w300,
                        fontFamily: "Poppins")),
                ),
              ),
            ]
      ),
      )
    );
  }
}
