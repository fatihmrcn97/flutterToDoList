import 'package:flutter/material.dart';

class TaskPage extends StatefulWidget {
  @override
  _TaskPageState createState() => _TaskPageState();
}

class Task {
  final String task;
  final bool isFinish;
  const Task(this.task, this.isFinish);
}

final List<Task> _taskList = [

  new Task("Call about", false),
  new Task("Fix unboarding falan filan", false),
  new Task("Neredesin beee", false),
  new Task("Eve git", false),
  new Task("Call about", true),
  new Task("Fix unboarding falan filan", true),
];

class _TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(0),
      itemCount: _taskList.length,
      itemBuilder: (context, index) {
        return _taskList[index].isFinish
            ? _taskComplete(_taskList[index].task)
            : _taskuncom(_taskList[index].task);
      },
    );
  }

  Widget _taskuncom(String task) {
    return Container(
      foregroundDecoration: BoxDecoration(
        color: Colors.purple,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 24.0, top: 18.0),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.radio_button_unchecked,
              color: Theme.of(context).accentColor,
              size: 20,
            ),
            SizedBox(
              height: 10,
            ),
            Text(task),
          ],
        ),
      ),
    );
  }

  Widget _taskComplete(String task) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, bottom: 18.0),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.radio_button_checked,
            color: Theme.of(context).accentColor,
            size: 20,
          ),
          SizedBox(
            height: 10,
          ),
          Text(task),
        ],
      ),
    );
  }
}
