import 'package:flutter/material.dart';
import 'package:todo_app/ui/Home.dart';

import 'model/Task.dart';

//Inserir em gradle.properties
//android.enableJetifier=true
//android.useAndroidX=true

//Inserir em build.gradle
//multiDexEnabled true em defaultConfig

List<Task> tasks = new List();

void main() async {
  tasks.add(new Task("Tarefa 1", "Uma descrição", Color(0x00000000)));
  tasks.add(new Task("Tarefa 1", "Uma descrição", Color(0x00000000)));
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      title: "Lista de Tarefas",
      theme: ThemeData(
          primaryColor: Colors.blueAccent,
          backgroundColor: Colors.blueAccent,
          bottomAppBarColor: Colors.blueAccent,
          textTheme:
              TextTheme(title: TextStyle(color: Colors.black45, fontSize: 15)),
          secondaryHeaderColor: Colors.yellowAccent),
    );
  }
}
