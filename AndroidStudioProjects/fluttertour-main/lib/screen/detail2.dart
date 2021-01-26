import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:test_error/screen/Detail3.dart';

class FormScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class Company {
  int id;
  String name;

  Company(
      this.id,
      this.name
      );

  static List<Company> getCompanies() {
    return <Company>[
      Company(1, 'A'),
      Company(2, 'B'),
      Company(3, 'C'),
    ];
  }
}

class FormScreenState extends State<FormScreen> {

  String _name;
  String _email;
  String _lname;
  String _idline;
  String _phoneNumber;
  String valueChoose;

  List<Company> _companies = Company.getCompanies();
  List<DropdownMenuItem<Company>> _dropdownMenuItems;
  Company _selected;

  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_companies);
    _selected = _dropdownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<Company>> buildDropdownMenuItems(List companies) {
    List<DropdownMenuItem<Company>> items = List();
    for (Company company in companies) {
      items.add(
        DropdownMenuItem(
          value: company,
          child: Text(company.name),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(Company selectedCompany) {
    setState(() {
      _selected = selectedCompany;
    });
  }


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'ชื่อ'),
      maxLength: 50,
      validator: (String value) {
        if (value.isEmpty) {
          return 'กรุณาระบุชื่อ';
        }
        return null;
      },
      onSaved: (String value) {
        _name = value;
      },
    );
  }

  Widget _buildLName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'นามสกุล'),
      maxLength: 50,
      validator: (String value) {
        if (value.isEmpty) {
          return 'กรุณาระบุนามสกุล';
        }

        return null;
      },
      onSaved: (String value) {
        _lname = value;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'อีเมล์'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'กรุณาระบุอีเมล์';
        }

        if (!RegExp(
            r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'กรุณาระบุอีเมล์ให้ถูกต้อง';
        }

        return null;
      },
      onSaved: (String value) {
        _email = value;
      },
    );
  }

  Widget _buildIDline() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'ไอดี ไลน์'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'กรุณาระบุ ไอดี ไลน์';
        }
        return null;
      },
      onSaved: (String value) {
        _idline = value;
      },
    );
  }


  Widget _buildPhoneNumber() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'เบอร์โทรติดต่อ'),
      keyboardType: TextInputType.phone,
      validator: (String value) {
        if (value.isEmpty) {
          return 'กรุณาระบุเบอร์โทรติดต่อ เช่น (08xxxxxxx)';
        }

        return null;
      },
      onSaved: (String value) {
        _phoneNumber = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("กรอกข้อมูลการจอง"),
          backgroundColor: Colors.blue[900],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildName(),
                _buildLName(),
                SizedBox(height: 5),
                _buildPhoneNumber(),
                SizedBox(height: 13),
                _buildEmail(),
                SizedBox(height: 13),
                _buildIDline(),
                SizedBox(height: 13),
                Text("เลือกวันเดินทาง",
                  style: TextStyle(
                      fontSize: 18, color: Colors.black
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(

                    padding: EdgeInsets.only(left: 16,right: 16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey,width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButton(
                      value: _selected,
                      items: _dropdownMenuItems,
                      onChanged: onChangeDropdownItem,
                      dropdownColor: Colors.white,
                      //value: valueChoose,
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 36,
                      isExpanded: true,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 50),
                RaisedButton(
                  color: Colors.blue[900],
                  child: Text(
                    'ยืนยัน',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  onPressed: () {
                    if (!_formKey.currentState.validate()) {
                      return;
                    }
                    _formKey.currentState.save();

                    Map<String,dynamic> user = {
                      'name':_name,
                      '_lname':_lname,
                      'phoneNumber':_phoneNumber,
                      'email':_email,
                      'idline':_idline,
                      'selected':_selected.name

                    };
                    var req = jsonEncode(user);

                    /*print(_name);
                    print(_lname);
                    print(_phoneNumber);
                    print(_email);
                    print(_idline);
                    print(_selected.name);*/
                    setState(() {

                    });

                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => NextPage(/*value: req*/ )));



                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}