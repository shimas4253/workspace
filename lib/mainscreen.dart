import 'package:flutter/material.dart';

class homescreen extends StatelessWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Container(
                color: Colors.pink,
                // width: double.infinity,
                // height: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('real madrid ',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 40, color: Colors.white)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () {
                              print('clicked');
                            },
                            child: Text('click me')),
                        IconButton(onPressed: () {}, icon: Icon(Icons.phone))
                      ],
                    ),
                    ElevatedButton(onPressed: () {}, child: Text('click me'))
                  ],
                )),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Colors.yellow, width: 10)),
              child: Center(child: Text('midddle container')),
            ),
          ),
          Expanded(
            child: Container(
                // width: double.infinity,
                // height: double.infinity,
                color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('real madrid ',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 40, color: Colors.white)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () {
                              print('clicked');
                            },
                            child: Text('click me')),
                        IconButton(onPressed: () {}, icon: Icon(Icons.phone))
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('click me'),
                    )
                  ],
                )),
          ),
        ],
      )),
    );
  }
}
