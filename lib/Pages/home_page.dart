import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do_tasks/Database/to_do_database.dart';

import 'package:to_do_tasks/Utilities/add_dialog.dart';
import 'package:to_do_tasks/Utilities/edit_dialog.dart';
import 'package:to_do_tasks/Utilities/to_do_tile.dart';
import 'package:to_do_tasks/Utilities/top_actions.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController addTaskController = TextEditingController();
  TextEditingController editTaskController = TextEditingController();
  ToDoDatabase database = ToDoDatabase();
  var db = Hive.box("myBox");

  bool checkBoxValue = false;

  void addButton() {
    setState(() {
      database.toDoList.add(addTaskController.text);
      database.updateDatabase();
    });
    Navigator.of(context).pop();
    addTaskController.clear();
  }

  void cancelButton(BuildContext context) {
    Navigator.of(context).pop();
  }

  void deleteButton(int index) {
    setState(() {
      database.toDoList.removeAt(index);
      database.updateDatabase();
    });
  }

  void editButton(int index) {
    setState(() {
      database.toDoList[index] = editTaskController.text;
    });
    database.updateDatabase();
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    if (db.get("ToDoList") == null) {
      database.initialState();
    } else {
      database.loadDatabase();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Center(
          child: Text(
            "TO DO",
          ),
        ),
      ),
      backgroundColor: Colors.green[200],
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TopActions(
                  checkBoxValue: checkBoxValue,
                  onChanged: (p0) {
                    setState(() {
                      checkBoxValue = !checkBoxValue;
                    });
                  },
                  tasksList: database.toDoList,
                ),
                IconButton(
                  onPressed: checkBoxValue
                      ? () {
                          setState(() {
                            database.toDoList
                                .removeRange(0, database.toDoList.length);
                            checkBoxValue = !checkBoxValue;
                            database.updateDatabase();
                          });
                        }
                      : null,
                  icon: const Icon(Icons.delete),
                  iconSize: 35,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 12,
            child: ListView.builder(
              itemCount: database.toDoList.length,
              itemBuilder: (context, index) {
                return ToDoTile(
                  taskName: database.toDoList[index],
                  editButton: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return EditDialog(
                          editButton: () {
                            editButton(index);
                          },
                          cancelButton: () {
                            cancelButton(context);
                          },
                          editController: editTaskController,
                          previousValue: database.toDoList[index],
                        );
                      },
                    );
                  },
                  deleteButton: () {
                    deleteButton(index);
                  },
                );
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AddDialog(
                addButton: () {
                  addButton();
                },
                cancelButton: () {
                  cancelButton(context);
                },
                addController: addTaskController,
              );
            },
          );
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        backgroundColor: Colors.green[400],
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}
