import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'editTask.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final _textTask = TextEditingController();
  var _listOfTasks = [];

  @override

  /// dispose method removes the widget
  void dispose() {
    _textTask.dispose();
    super.dispose();
  }

  /// verification function for empty tasks
  void addToList(String _task) {
    if (_task.isNotEmpty || _task.length > 0) {
      setState(() => _listOfTasks.add(_task));
    }
  }

  /// Deletes item from the list
  void _deleteItem(int index) {
    setState(() => _listOfTasks.removeAt(index));
  }

  /// Put the item in the textbox and removes
  /// the task from the list to prevent duplicates

  void _editItem(int index) {
    setState(() {
      _textTask.text = _listOfTasks[index].toString();
      _listOfTasks.removeAt(index);
    });
  }

  Widget buildViewTasks() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: _listOfTasks.length,
        itemBuilder: (context, index) {
          return _getSliableListTiles(context, index);
        });
  }

  //Slidable Widget
  Widget _getSliableListTiles(BuildContext context, int index) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: Container(
        color: Colors.white,
        child: ListTile(title: Text(_listOfTasks[index])),
      ),
      actions: <Widget>[
        IconSlideAction(
            caption: 'Edit',
            color: Colors.blue,
            icon: Icons.edit,
            onTap: () => _editItem(index)),
        IconSlideAction(
            caption: 'Delete',
            color: Colors.red,
            icon: Icons.delete,
            onTap: () => _deleteItem(index)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          TextField(
            controller: _textTask,
          ),
          new Expanded(child: buildViewTasks())
        ],
      ),
      floatingActionButton: FlatButton(
        // onPressed: () {
        //   addToList(_textTask.text); // add to list view
        //   _textTask.text = ""; // remove the task from the text field
        // },
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EditTask()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
