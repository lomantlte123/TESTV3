import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_error/screen/D.dart';


/*class NextPage extends StatefulWidget {

   var value;
   NextPage({Key key , this.value}) : super (key: key);

  @override
  _NextPageState createState() => new _NextPageState();
}

class _NextPageState extends State<NextPage> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
        title:  Text(
            "Next Page"
        ),
      ),body: Center(
      child: Text(
            widget.value
    ),
    ),
    );
  }
}*/




class NextPage extends StatefulWidget {
   final User value;
   NextPage({Key key , this.value}) : super (key: key);
  @override
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TEST"),
      ),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Center(
          child: Column(
            children: [
              Padding(
                child: Text(
                  "ชื่อ :  ${widget.value.name}",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),padding: EdgeInsets.only(bottom: 20.0),
              ),

              Padding(
                child: Text(
                  "นามสกุล :  ${widget.value.lname}",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),padding: EdgeInsets.only(bottom: 20.0),
              ),

              Padding(
                child: Text(
                  "อีเมล์ :  ${widget.value.email}",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),padding: EdgeInsets.only(bottom: 20.0),
              ),

              Padding(
                child: Text(
                  "ไอดี ไลน์ :  ${widget.value.idline}",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),padding: EdgeInsets.only(bottom: 20.0),
              ),

              Padding(
                child: Text(
                  "เบอร์โทรติดต่อ :  ${widget.value.phoneNumber}",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),padding: EdgeInsets.only(bottom: 20.0),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
