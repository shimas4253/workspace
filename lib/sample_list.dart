import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workspace/screen2.dart';

class samlelistview extends StatefulWidget {
  const samlelistview({Key? key}) : super(key: key);

  @override
  State<samlelistview> createState() => _samlelistviewState();
}

class _samlelistviewState extends State<samlelistview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Whats upp')),
      body: ListView.separated(
          itemBuilder: (ctx, index) {
            return ListTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => screenTwo(
                         //name: 'Person $index',
                        )));
              },
              title: Text('Person $index'),
              subtitle: Text('last message $index'),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?cs=srgb&dl=pexels-mohamed-abdelghaffar-771742.jpg&fm=jpg'),
                radius: 30,
              ),
              trailing: Text('$index:00 pm'),
            );
          },
          separatorBuilder: (ctx, index) {
            return Divider();
          },
          itemCount: 50),
    );
  }
}
