import 'package:flutter/material.dart';
import 'package:todo_app/main.dart';

class TaskDonePage extends StatefulWidget {
  @override
  _TaskDonePageState createState() => _TaskDonePageState();
}

class _TaskDonePageState extends State<TaskDonePage> {
  countTasksDone() {
    int count = 0;
    tasks.forEach((v) {
      v.isDone == true ? count++ : count;
    });
    return count;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 75),
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
                        'Tarefas',
                        style: TextStyle(
                            fontSize: 28,
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Prontas',
                        style: TextStyle(fontSize: 28, color: Colors.grey),
                      ),
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
          Expanded(
            child: Scaffold(
                backgroundColor: Colors.white,
                body: Container(
                  //height: 300,
                  child: NotificationListener<OverscrollIndicatorNotification>(
                      onNotification: (overscroll) {
                        overscroll.disallowGlow();
                        return true;
                      },
                      child: ListView.builder(
                          itemCount: countTasksDone(),
                          itemBuilder: (context, index) {
                            if (tasks[index].isDone)
                              return GestureDetector(
                                onLongPress: () {},
                                child: Card(
                                  child: Column(
                                    children: <Widget>[
                                      Padding(
                                          padding: EdgeInsets.only(top: 15),
                                          child: ListTile(
                                            //leading: Icon(Icons.assignment_ind),
                                            title: Text('${tasks[index].name}'),
                                            subtitle:
                                                Text(tasks[index].description),
                                          ))
                                    ],
                                  ),
                                ),
                              );
                            else
                              return Container();
                          })),
                )),
          )
        ],
      ),
    );
  }
}
