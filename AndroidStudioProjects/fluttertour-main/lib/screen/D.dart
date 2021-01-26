import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_error/screen/Detail3.dart';


class User {
   String name,lname,email,idline,phoneNumber;

    User({
     this.name,
     this.lname,
      this.email,
      this.idline,
      this.phoneNumber,
    });
}

class Test0 extends StatefulWidget {

  @override
  _Test0State createState() => _Test0State();
}

class _Test0State extends State<Test0> {

  var _name = new TextEditingController();
  var _lname = new TextEditingController();
  var _email = new TextEditingController();
  var _idline = new TextEditingController();
  var _phoneNumber = new TextEditingController();

final _key = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: new AppBar(
        title: Text('กรอกข้อมูลการจอง'),
        backgroundColor: Colors.blue[900],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Center(
            child: Form(
              key : _key,
              child: Column(
                children: <Widget>[
                  Padding(
                    child: Text(
                      "",
                      style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),
                      textAlign: TextAlign.center,

                    ),
                    padding: EdgeInsets.only(bottom: 20.0),
                  ),
                   TextFormField(
                    decoration: InputDecoration(labelText: "ชื่อ",labelStyle: TextStyle(fontSize: 17,color: Colors.black)),
                    controller: _name,
                     keyboardType: TextInputType.text,
                     maxLength: 50,
                     inputFormatters: [
                       BlacklistingTextInputFormatter(RegExp('[0-9]')),

                     ],
                     validator: (String value) {
                       if (value.isEmpty) {
                         return 'กรุณาระบุชื่อ';
                       }
                       return null;
                     },
                     onSaved: (String value) {

                     },

                  ),
                   TextFormField(
                    decoration: InputDecoration(labelText: "นามสกุล",labelStyle: TextStyle(fontSize: 17,color: Colors.black)),
                    controller: _lname,
                     maxLength: 50,
                     keyboardType: TextInputType.text,
                     validator: (String value) {
                       if (value.isEmpty) {
                         return 'กรุณาระบุนามสกุล';
                       }
                       return null;
                     },
                     onSaved: (String value) {

                     },
                  ),
                   TextFormField(
                    decoration: InputDecoration(labelText: "อีเมล์",labelStyle: TextStyle(fontSize: 17,color: Colors.black)),
                    controller: _email,
                     keyboardType: TextInputType.emailAddress,
                     validator: (String value) {
                       if (value.isEmpty) {
                         return 'กรุณาระบุอีเมล์';
                       }else if (!RegExp(
                           r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                           .hasMatch(value)) {
                         return 'กรุณาระบุอีเมล์ให้ถูกต้อง';
                       }
                       return null;
                     },
                     onSaved: (String value) {

                     },

                  ),
                   TextFormField(
                    decoration: InputDecoration(labelText: "ไอดี ไลน์",labelStyle: TextStyle(fontSize: 17,color: Colors.black)),
                    controller: _idline,
                     keyboardType: TextInputType.text,
                     validator: (String value) {
                       if (value.isEmpty) {
                         return 'กรุณาระบุ ไอดี ไลน์';
                       }
                       return null;
                     },
                     onSaved: (String value) {

                     },
                  ),
                   TextFormField(
                    decoration: InputDecoration(labelText: "เบอร์โทรติดต่อ",labelStyle: TextStyle(fontSize: 17,color: Colors.black)),
                    controller: _phoneNumber,
                     keyboardType: TextInputType.phone,
                     validator: (String value) {
                       if (value.isEmpty) {
                         return 'กรุณาระบุเบอร์โทรติดต่อ เช่น (08xxxxxxx)';
                       }
                       return null;
                     },
                     onSaved: (String value) {

                     },
                  ),
                   SizedBox(height: 20),
                   RaisedButton(
                    color: Colors.blue[900],
                    child: Text("ยืนยัน",style: TextStyle(color: Colors.white, fontSize: 18),),
                    onPressed:(){
                      if (!_key.currentState.validate()) {
                        return;
                      }
                      _key.currentState.save();

                        var route = new MaterialPageRoute(
                          builder: (BuildContext context) =>
                            NextPage(
                              value: User(
                                name: _name.text,
                                lname: _lname.text,
                                idline: _idline.text,
                                email: _email.text,
                                phoneNumber: _phoneNumber.text,
                              ),
                            ),
                       );
                        Navigator.of(context).push(route);
                      },

                      ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

