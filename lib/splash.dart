import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workspace/main.dart';
import 'package:workspace/sharedprif_login.dart';
import 'package:workspace/welcome.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    checkUserLogedIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 400, left: 180),
            child: Image(
                image: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQz1qceb-FIDahiZTq_8R1F3Ln6APST9bBuIA&usqp=CAU',
                    scale: 3)),
          ),
        ],
      ),
    );
  }

  Future<void> gotoLogin() async {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => loginPage()));
  }

  checkUserLogedIn() async {
    final _sharedPriffs = await SharedPreferences.getInstance();
    final _userLogedIn = _sharedPriffs.getBool(SAVE_KEY_NAME);
    if (_userLogedIn == null || _userLogedIn == false) {
      gotoLogin();
    } else {
      await Future.delayed(Duration(seconds: 3));
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => welcomePage()));
    }
  }
}

