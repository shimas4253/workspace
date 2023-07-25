import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workspace/main.dart';
import 'package:workspace/sharedprif_signup.dart';
import 'package:workspace/welcome.dart';

class loginPage extends StatefulWidget {
  loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  bool _isDatamatched = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login page'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 120, right: 20, left: 20),
              child: TextFormField(
                validator: (value) {
                  // if(_isDatamatched){
                  //   return null;
                  // }else{
                  //   return 'error';
                  // }
                  if (value == null || value.isEmpty) {
                    return 'value is empty';
                  } else {
                    return null;
                  }
                },
                controller: _usernameController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.account_circle_outlined),
                  labelText: 'username',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, right: 20, left: 20),
              child: TextFormField(
                validator: (value) {
                  // if(_isDatamatched){
                  //   return null;
                  // }else{
                  //   return 'error';
                  // }
                  if (value == null || value.isEmpty) {
                    return 'value is empty';
                  } else {
                    return null;
                  }
                },
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.lock_outline),
                  labelText: 'password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              ),
            ),
            Center(
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => signupPage()));
                    },
                    child: Text("Don't have an account..?Sign up"))),
            Center(
                child: ElevatedButton.icon(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        checkLogin(context);
                      } else {
                        print('data is empty');
                      }
                    },
                    icon: Icon(Icons.check),
                    label: Text('Login'))),
          ],
        ),
      ),
    );
  }

  checkLogin(BuildContext cxt) async {
    final _error = 'username and password doesnot match';
    final _username = _usernameController.text;
    final _password = _passwordController.text;
    if (_username == _password) {
      final _sharedPrifs = await SharedPreferences.getInstance();
      await _sharedPrifs.setBool(SAVE_KEY_NAME, true);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => welcomePage()));
    } else {
      ScaffoldMessenger.of(cxt).showSnackBar(SnackBar(
        content: Text(_error),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(10),
        backgroundColor: Colors.red,
      ));
      // showDialog(context: cxt, builder: (cntx) {
      //   return AlertDialog(
      //     title: Text('error'),
      //     content: Text(_error),
      //     actions: [
      //       TextButton(onPressed: (){
      //         Navigator.of(cntx).pop();
      //       }, child: Text('close'))
      //     ],
      //   );
      // });
      // setState(() {
      //   _isDatamatched=false;
      // });
    }
  }
}
