import 'package:flutter/material.dart';
import 'taskStructure.dart';
import 'package:date_time_picker/date_time_picker.dart';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';

class AddTask extends StatefulWidget {
  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final _taskTitleController = TextEditingController();
  final _taskLongController = TextEditingController();

  String selectedDate = DateFormat('d MMM, yyy').format(DateTime.now());

  String _selectDate(val) {
    setState(() {
      selectedDate = val;
    });
    return selectedDate;
  }
  // Future<void> _selectDate(BuildContext context) {
  //   // final DateTime picked = await showDatePicker(
  //   //     context: context,
  //   //     initialDate: selectedDate,
  //   //     firstDate: DateTime(2015, 8),
  //   //     lastDate: DateTime(2101));
  //   DateTimePicker(
  //       dateMask: 'd MMM, yyy',
  //       initialValue: DateTime.now().toString(),
  //       firstDate: DateTime(2000),
  //       lastDate: DateTime(2100),
  //       icon: Icon(Icons.access_alarm_outlined),
  //       dateLabelText: 'Date',
  //       timeLabelText: "Hour",
  //       onChanged: (val) => print(val),
  //       validator: (val) {
  //         print(val);
  //         return null;
  //       },
  //       onSaved: (val) {
  //         setState(() {
  //           selectedDate = val;
  //         });
  //       });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Task"),
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
          Padding(
              padding: EdgeInsets.only(top: 25.0),
              // child: showDatePicker(
              //   firstDate: DateTime.now(),
              //   initialDate: DateTime.now(),
              //   lastDate: DateTime.now().add(new Duration(days: 365)),
              // ),
              child: Column(
                children: [
                  DateTimePicker(
                      type: DateTimePickerType.dateTimeSeparate,
                      dateMask: 'd MMM, yyy',
                      initialValue: DateTime.now().toString(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                      icon: Icon(Icons.calendar_today_rounded),
                      dateLabelText: 'Date',
                      timeLabelText: "Hour",
                      onChanged: (val) => _selectDate(val),
                      validator: (val) {
                        return _selectDate(val);
                      },
                      onSaved: (val) {
                        _selectDate(val);
                      }),
                ],
              ))
        ],
      ),
      floatingActionButton: FlatButton(
        onPressed: () {
          Navigator.pop(
              context,
              new TaskStructure(_taskTitleController.text,
                  _taskLongController.text, selectedDate));
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
