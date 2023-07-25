import 'package:flutter/material.dart';
import 'package:workspace/sample_navigation.dart';

class screenTwo extends StatelessWidget {
  const screenTwo({Key? key}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 2'),
      ),
body: Column(
  children: [
    Text('value is present')
  ],
),
    );
  }
}
