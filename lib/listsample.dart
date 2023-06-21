import 'package:flutter/material.dart';

class samplelist extends StatefulWidget {
   samplelist({Key? key}) : super(key: key);

  @override
  State<samplelist> createState() => _samplelistState();
}

class _samplelistState extends State<samplelist> {
  final _textController=TextEditingController();

  String _displayText='data will be shown here';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.white10,
            child: Column(
              children: [
                TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Type something'
                  ),
                ),
                ElevatedButton(onPressed: () {
                  print(_textController.text);
                  setState((){
                    _displayText=_textController.text;
                  });
                }, child: Text('click here')),
                Text(_displayText)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
