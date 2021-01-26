import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:test_error/screen/Pro.dart';
import 'screen/Loginscreen.dart';
import 'screen/SignUp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'bloc/listTileColorBloc.dart';
import 'bloc/cartlistBloc.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [
        //add yours BLoCs controlles
        Bloc((i) => CartListBloc()),
        Bloc((i) => ColorBloc()),
      ],
      child: MaterialApp(
        title: "Food Delivery",
        home: LoginScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}



