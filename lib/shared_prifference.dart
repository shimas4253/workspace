import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workspace/screen2.dart';
import 'package:workspace/welcome.dart';

class login extends StatelessWidget {
  login({Key? key}) : super(key: key);
  final _textEditcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    getSavedData(context);
    return Scaffold(
      appBar: AppBar(title: Text('shared preffernce')),
      body: SafeArea(
        child: Column(
          children: [
            TextFormField(
              controller: _textEditcontroller,
            ),
            ElevatedButton(onPressed: () {                
              saveData();
              getSavedData(context);
            }, child: Text('Save value'))
          ],
        ),
      ),
    );
  }

  Future<void> saveData() async {
    //shared prefference
    final sharedPrif = await SharedPreferences.getInstance();
    //save value
    await sharedPrif.setString('saved_value', _textEditcontroller.text);
  }

  Future<void> getSavedData(BuildContext context) async {
    final sharedprifs = await SharedPreferences.getInstance();
    final savedValue = sharedprifs.getString('saved_value');
    if (savedValue != null) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (cntx) => welcomePage()));
    }
  }
}
