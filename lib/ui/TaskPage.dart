import 'package:flutter/material.dart';
import 'package:todo_app/ui/AddListPage.dart';
import 'package:todo_app/ui/TaskDetailPage.dart';

class TaskPage extends StatefulWidget {
  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  bool isSelected = false;
  void setIsSelected(selected) {
    setState(() {
      isSelected = selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: isSelected
            ? () {}
            : () {
                Navigator.of(context).push(PageRouteBuilder(
                    pageBuilder: (_, __, ___) => new AddListPage()));
              },
        child: Icon(isSelected ? Icons.delete : Icons.add),
        backgroundColor: isSelected ? Colors.red : null,
        shape: RoundedRectangleBorder(
            side: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
      body: ListView(
        children: <Widget>[
          new Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.grey,
                        height: 1.5,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Minhas',
                            style: TextStyle(fontSize: 30, color: Colors.grey),
                          ),
                          Text(
                            'Tarefas',
                            style: TextStyle(
                                fontSize: 28,
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.grey,
                        height: 1.5,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Padding(
              padding: EdgeInsets.only(top: 50),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  /*NotificationListener<OverscrollIndicatorNotification>(
                      onNotification: (overscroll) {
                        overscroll.disallowGlow();
                        return true;
                      },
                      child: ),*/
                  Container(
                    height: MediaQuery.of(context).size.height - 200,
                    child: TaskDetailPage(),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
