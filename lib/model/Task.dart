import 'package:flutter/material.dart';

class Task {
  String name;
  String description;
  bool isDone = false;
  Color color;

  Task(this.name, this.description, this.color);
}
