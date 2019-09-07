import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: "Montserrat"
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: 35,
            color: Theme.of(context).accentColor,
          ),
          Positioned(
            right: 0,
            child: Text(
              "6",
              style: TextStyle(
                fontSize: 200,
                color: Color(0x1000000),
              ),
            ),
          ),
          _mainContent(context),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Column _mainContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 60,
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            "MONDAY",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: _button(context),
        ),
        _taskuncom("Call about"),
        _taskuncom("Fix unboarding falan filan"),
        _taskuncom("Neredesin beee"),
        _taskuncom("Eve git"),
        Divider(),
        SizedBox(
          height: 16,
        ),
        _taskComplete("Call about"),
        _taskComplete("Fix unboarding falan filan"),
      ],
    );
  }

  Widget _taskuncom(String task) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, bottom: 18.0),
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

  Widget _button(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.all(14.0),
            color: Theme.of(context).accentColor,
            onPressed: () {},
            child: Text("Tasks"),
          ),
        ),
        SizedBox(
          width: 32,
        ),
        Expanded(
          child: MaterialButton(
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Theme.of(context).accentColor),
                borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.all(14.0),
            color: Colors.white,
            textColor: Theme.of(context).accentColor,
            onPressed: () {},
            child: Text("Events"),
          ),
        ),
      ],
    );
  }
}
