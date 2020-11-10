import 'package:flutter/material.dart';
import 'back.dart';
import 'thirdPage.dart';
import 'mess.dart';

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
  final List<Widget> _children = [SecondScreen(), FirstScreen(), ThirdScreen()];
  int _selectedIndex = 0;

  void _selectNavIcon(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text("TODO"),
        centerTitle: true,
      ),
      body: IndexedStack(index: _selectedIndex, children: _children),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex:
            _selectedIndex, // this will be set when a new tab is tapped
        onTap: _selectNavIcon,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.list),
            label: 'List',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_alert), label: 'Reminders')
        ],
      ),
    ));
  }
}
