//import 'package:transparent_image/transparent_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:test_error/provider/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:test_error/auth.dart';
import 'Loginscreen.dart';



class LoggedInWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Container(
      alignment: Alignment.center,
      color: Colors.blueGrey.shade900,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Logged In',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: getProfileImage(),
          ),
          //buildCircleAvatar(),
          SizedBox(height: 8),
          Text(
            'Name: ' + user.displayName,
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 8),
          Text(
            'Email: ' + user.email,
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()
                  ));
            },
            child: Text('Logout'),
          )
        ],
      ),
    );

  }

  getProfileImage() {
    final user = FirebaseAuth.instance.currentUser;
    if(user.photoURL != null) {
      return Image.network(user.photoURL, height: 100, width: 100);
    } else {
      return Icon(Icons.account_circle, size: 100);
    }
  }

  Widget buildCircleAvatar() {
    final user = FirebaseAuth.instance.currentUser;
    return Container(
      child: CircleAvatar(
        foregroundColor: Colors.deepOrange,
        maxRadius: 40,
        backgroundColor: Colors.blue,
        backgroundImage: NetworkImage(user.photoURL),
      ),
    );
  }

  void buildProfile(user) {
    final user = FirebaseAuth.instance.currentUser;
    if(user.photoURL != null){
      CircleAvatar(
        maxRadius: 40,
        backgroundColor: Colors.blue,
        backgroundImage: NetworkImage(user.photoURL),
      );
    } else {
      CircleAvatar(
        maxRadius: 40,
        backgroundColor: Colors.blue,
      );
    }
  }

  /*getProfileImage(){
    if (user.currentUser.photoURL != null) {
      return Image.network(_auth.currentUser.photoURL, height: 100, width: 100);
    } else {
      return Icon(Icons.account_circle, size: 100);
    }
  }*/


}
