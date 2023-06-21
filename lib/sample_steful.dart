import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class sampleSteful extends StatefulWidget {
  const sampleSteful({Key? key}) : super(key: key);

  @override
  State<sampleSteful> createState() => _sampleStefulState();
}

class _sampleStefulState extends State<sampleSteful> {
  int _counter=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('demo flutter'),
      ),
      body: Center(
        child: DisplayText(counterText: _counter.toString())
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          print(_counter);
          setState((){
            _counter=_counter+1;
          });
        },
      ),
    );
  }
}
class DisplayText extends StatelessWidget {
final String counterText;

  const DisplayText({super.key, required this.counterText});

  @override
  Widget build(BuildContext context) {
    return Text(counterText);
  }
}

