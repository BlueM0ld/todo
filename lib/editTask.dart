import 'package:flutter/material.dart';

class EditTask extends StatefulWidget {
  @override
  _EditTaskState createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
//final holders from the text page

  final _taskTitleController = TextEditingController();
  final _taskLongController = TextEditingController();

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
                controller: _taskTitleController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Task Name'),
              )),
          Padding(
              padding: EdgeInsets.only(top: 25.0),
              child: TextField(
                controller: _taskLongController,
                maxLines: null,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Long text name ;)'),
              )),
        ],
      ),
      floatingActionButton: FlatButton(
        // onPressed: () {
        //   addToList(_textTask.text); // add to list view
        //   _textTask.text = ""; // remove the task from the text field
        // },
        onPressed: () {
          var _objectFData = [
            _taskTitleController.text,
            _taskLongController.text
          ];
          Navigator.pop(context, _objectFData);
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
