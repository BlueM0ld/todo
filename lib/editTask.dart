import 'package:flutter/material.dart';

class EditTask extends StatefulWidget {
  @override
  _EditTaskState createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Tasks"),
      ),
      body: ListView(
        padding: EdgeInsets.all(24),
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(top: 25.0),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Task Name'),
              )),
          Padding(
              padding: EdgeInsets.only(top: 25.0),
              child: TextField(
                maxLines: null,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Long text name ;)'),
              )),
        ],
      ),
    );
  }
}
