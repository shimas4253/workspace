import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workspace/sample_list.dart';
import 'package:workspace/sample_navigation.dart';
import 'package:workspace/sample_steful.dart';
import 'package:workspace/screen2.dart';
import 'package:workspace/shared_prifference.dart';
import 'package:workspace/sharedprif_login.dart';
import 'package:workspace/splash.dart';
const SAVE_KEY_NAME='user loged in';
main() async {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.teal),
      home: splashScreen(),
      // routes: {
      //   'Screen 1':(context)=>sampleNav(),
      //   'Screen 2':(context){
      //     return screen2();
      //   }
      // }
    );
  }
}

