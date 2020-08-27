import 'package:flutter/material.dart';

void main() => {runApp(MyApp())};

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "This",
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _textTask = TextEditingController();
  var _listOfTasks = [
    "B",
    "B",
    "B",
    "B",
    "A",
    "A",
    "B",
    "B",
    "A",
    "A",
    "A",
    "A",
    "A",
    "A",
    "A",
    "A",
    "f",
    "f",
  ];

  @override
  void dispose() {
    _textTask.dispose();
    super.dispose();
  }

  void addToList(String _task) {
    if (_task.isNotEmpty || _task.length > 0) {
      setState(() => _listOfTasks.add(_task));
    }
  }

  Widget buildViewTasks() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: _listOfTasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_listOfTasks[index]),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        title: Text("TODO"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: _textTask,
          ),
          new Expanded(child: buildViewTasks())
        ],
      ),
      floatingActionButton: FlatButton(
        onPressed: () {
          addToList(_textTask.text);
        },
        child: Icon(Icons.add),
      ),
    ));
  }
}
