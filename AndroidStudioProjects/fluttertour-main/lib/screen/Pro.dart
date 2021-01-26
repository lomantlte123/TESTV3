import 'package:flutter/material.dart';


class MyHome extends StatefulWidget {
  MyHome({Key key}) : super(key: key);
  @override
  _MyHomeState createState() => _MyHomeState();
}
class _MyHomeState extends State<MyHome> {
  get bottomNavigationBar => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('โปรไฟล์'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
        leading: Icon(Icons.arrow_back), //onPressed: () {},
      ),
      body: profileView(),
      backgroundColor: Colors.cyanAccent[50],     // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  Widget profileView() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 10,0 ,10),
          child: Stack(
            children: <Widget>[
              CircleAvatar(
                radius: 70,
                child: ClipOval(child: Image.network('https://f.ptcdn.info/072/068/000/q5hkd7kiblULmrfir3C-o.jpg',
                  height: 140, width: 140, fit: BoxFit.cover,),),
              ),
              Positioned(bottom: 1, right: 1 ,child: Container(
                height: 40, width:40,
                child: Icon(Icons.add_a_photo, color: Colors.white,),
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ))
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(50, 0, 30, 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(height: 0, width: 0,
              ),
              Text('my name is ...', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              Container(height: 0,width: 0)
            ],
          ),
        ),
        Expanded(child: Container(
          height: 0, width: 600,
          padding: EdgeInsets.all(25.0),
          child : Center(
              child: Column(
                  children: <Widget>[
                    // Text('Profile', style: TextStyle(fontSize: 30.0,color: Colors.black),),
                    Padding(padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget> [
                          Icon(Icons.supervised_user_circle),
                          Expanded(child: new TextField(decoration: InputDecoration(hintText: "   Private"),),),
                          Icon(Icons.keyboard_arrow_right_outlined),
                        ] ,
                      ),
                    ), Padding(padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget> [
                          Icon(Icons.history_edu_rounded),
                          Expanded(child: new TextField(decoration: InputDecoration(hintText: "   Purchase History"),),),
                          Icon(Icons.keyboard_arrow_right_outlined),
                        ] ,
                      ),
                    ),
                    Padding(padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget> [
                          Icon(Icons.contact_support),
                          Expanded(child: new TextField(decoration: InputDecoration(hintText: "   Help & Sup port"),),),
                          Icon(Icons.keyboard_arrow_right_outlined),
                        ] ,
                      ),
                    ),
                    Padding(padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget> [
                          Icon(Icons.settings),
                          Expanded(child: new TextField(decoration: InputDecoration(hintText: "   Settings"),),),
                          Icon(Icons.keyboard_arrow_right_outlined),
                        ] ,
                      ),
                    ),
                  ]
              )
          ),
        ),
        )
      ],
    );
  }
}
