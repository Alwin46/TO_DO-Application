import 'package:hive_flutter/adapters.dart';

class ToDoDatabase {
  var db = Hive.box("myBox");

  List toDoList = [];

  void initialState() {
    toDoList = ["Material App", "To Do Tasks"];
  }

  void loadDatabase() {
    toDoList = db.get("ToDoList");
  }

  void updateDatabase() {
    db.put("ToDoList", toDoList);
  }
}
