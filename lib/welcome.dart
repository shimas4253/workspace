import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workspace/sharedprif_login.dart';

class welcomePage extends StatefulWidget {
  welcomePage({Key? key}) : super(key: key);

  @override
  State<welcomePage> createState() => _welcomePageState();
}

class _welcomePageState extends State<welcomePage> {
    var selectedindex=0;

  void itemTap(int index){
    setState((){
      selectedindex=index;
    });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Instagram',
          style: TextStyle(
              fontStyle: FontStyle.italic, fontSize: 30, color: Colors.black),
        ),
        elevation: 1,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.heart_broken,color: Colors.black,)),
          IconButton(onPressed: (){}, icon: Icon(Icons.sms_outlined,color: Colors.black,)),
          // IconButton(
          //     onPressed: () {
          //       signOut(context);
          //     },
          //     icon: Icon(Icons.add_card_outlined,color: Colors.black,))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black,
        currentIndex: selectedindex,
        onTap: itemTap,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_box_outlined), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.video_collection_outlined), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined), label: '')
        ],
      ),
    );
  }

  signOut(BuildContext cntx) async {
    final _sharedprifs = await SharedPreferences.getInstance();
    await _sharedprifs.clear();
    Navigator.of(cntx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => loginPage()), (route) => false);
  }
}
