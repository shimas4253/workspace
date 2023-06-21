import 'package:flutter/material.dart';
import 'package:workspace/sample_list.dart';
import 'package:workspace/sample_steful.dart';

void main(){
  runApp(Myapp());
}
class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch:Colors.teal),
      home:samlelistview(),
    );
  }
}

