import 'package:flutter/material.dart';
import 'package:workspace/screen2.dart';

class sampleNav extends StatelessWidget {
  const sampleNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 1'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed('Screen 2');
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => screen2()));
          },
          child: Text('gop to Screen2'),
        ),
      ),
    );
  }
}
