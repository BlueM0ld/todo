import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'taskStructure.dart';
import 'package:date_time_picker/date_time_picker.dart';

class EditTask extends StatefulWidget {
  final TaskStructure task;
  EditTask({Key key, this.task}) : super(key: key);

  @override
  _EditTaskState createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
//final holders from the text page

  String selectedDate = DateFormat('d MMM, yyy').format(DateTime.now());

  String _selectDate(val) {
    setState(() {
      selectedDate = val;
    });
    return selectedDate;
  }

  @override
  Widget build(BuildContext context) {
    var _taskTitleController =
        TextEditingController(text: widget.task.getTaskTitle.toString());
    var _taskLongController =
        TextEditingController(text: widget.task.getTaskLong.toString());

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
                      initialValue: widget.task.getDate,
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
                  _taskLongController.text, selectedDate.toString()));
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
