import 'package:flutter/material.dart';
import 'package:todo_app/main.dart';

class TaskDetailPage extends StatefulWidget {
  @override
  _TaskDetailPageState createState() => _TaskDetailPageState();
}

class _TaskDetailPageState extends State<TaskDetailPage> {
  Color pickerColor;
  Color currentColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          //height: 300,
          child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overscroll) {
                overscroll.disallowGlow();
                return true;
              },
              child: ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    if (tasks[index].isDone != true)
                      return Dismissible(
                          key: Key(
                              DateTime.now().millisecondsSinceEpoch.toString()),
                          direction: DismissDirection.horizontal,
                          onDismissed: (direction) {
                            switch (direction) {
                              case DismissDirection.startToEnd:
                                tasks[index].isDone = true;
                                break;
                              case DismissDirection.endToStart:
                                tasks.removeAt(index);
                                break;
                              default:
                            }
                          },
                          background: Container(
                            color: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Icon(
                                    Icons.done,
                                    color: Colors.blue,
                                    size: 40,
                                    //color: Colors.black,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                )
                              ],
                            ),
                          ),
                          secondaryBackground: Container(
                            color: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                    size: 40,
                                    //color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                          ),
                          child: Card(
                            color: tasks[index].color,
                            child: Column(
                              children: <Widget>[
                                Padding(
                                    padding: EdgeInsets.only(top: 15),
                                    child: ListTile(
                                      //leading: Icon(Icons.assignment_ind),
                                      title: Text(
                                        '${tasks[index].name}',
                                        style: TextStyle(
                                            color: tasks[index]
                                                        .color
                                                        .computeLuminance() >
                                                    0.2
                                                ? Colors.black
                                                : Colors.white),
                                      ),
                                      subtitle: Text(tasks[index].description),
                                    ))
                              ],
                            ),
                          ));
                    else
                      return Container();
                  })),
        ));
  }
}
