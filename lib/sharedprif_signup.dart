import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workspace/main.dart';
import 'package:workspace/welcome.dart';

class signupPage extends StatelessWidget {
  signupPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  final _confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign up page'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 69, right: 20, left: 20),
              child: TextFormField(
                controller: _usernameController,
                validator: (value) {
                  if (value!.isEmpty||!value.contains('@gmail')) {
                    return 'errror';
                  } else{
                    return null;
                  }
                },
                decoration: InputDecoration(
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
                obscureText: true,
                controller: _passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 5) {
                    return 'errror';
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_outline),
                  labelText: 'password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, right: 20, left: 20),
              child: TextFormField(
                obscureText: true,
                controller: _confirmPassController,
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                       _passwordController.text!= _confirmPassController.text ||
                      value.length < 5) {
                    return 'error';
                  } else {}
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_outline),
                  labelText: 'confirm password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              ),
            ),
            Center(
                child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _chechDetails(context);
                      }
                    },
                    child: Text('Sign in')))
          ],
        ),
      ),
    );
  }

  _chechDetails(BuildContext context) async{
    final _sharedprifs=await SharedPreferences.getInstance();
    final _error =
        'password must contain atleas 6 charecters and username musr contain @gmail';
    final _username = _usernameController.text;
    final _password = _passwordController.text;
    final _confirmpass = _confirmPassController.text;
    await _sharedprifs.setBool(SAVE_KEY_NAME, true);
    if (_username.contains('@gmail') && _password == _confirmpass) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => welcomePage()));
    } else {
      return ScaffoldMessenger(child: SnackBar(content: Text(_error)));
    }
  }
}
