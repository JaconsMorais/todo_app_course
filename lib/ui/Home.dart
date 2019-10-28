import 'package:flutter/material.dart';
import 'package:todo_app/ui/TaskDonePage.dart';
import 'package:todo_app/ui/TaskPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _pages = [TaskPage(), TaskDonePage()];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        //fixedColor: Colors.yellowAccent,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: const Icon(Icons.calendar_view_day), title: const Text("")),
          BottomNavigationBarItem(
              icon: const Icon(Icons.check), title: const Text("")),
        ],
      ),
      body: _pages[_currentIndex],
    );
  }

  void onTabTapped(index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
