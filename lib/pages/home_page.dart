import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_doproject/data/database.dart';
//import 'package:flutter/widgets.dart';
import 'package:to_doproject/utils/add_task.dart';
import 'package:to_doproject/utils/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox = Hive.box('myBox');

  @override
  void initState() {
    if (_myBox.get("TODOLIST") == null) {
      db.createIniateData();
    } else {
      db.loadData();
    }

    super.initState();
  }

  final _controller = TextEditingController();

  Database db = Database();

  // List toDoList = [
  //   ["Make Tutorial", false],
  //   ["Make Food", true]
  // ];
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      // Ensure db.toDoList[index][1] is treated as a bool
      if (db.toDoList[index][1] is bool) {
        db.toDoList[index][1] = !(db.toDoList[index][1] as bool);
      }
    });
    db.updateData();
  }

  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return AddTask(
            controller: _controller,
            onCancel: () => Navigator.of(context).pop(),
            onSave: saveNewTask,
          );
        });
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[200],
      appBar: AppBar(
        title: const Center(
          child: Text(
            "TO DO",
            textAlign: TextAlign.center,
          ),
        ),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(
          Icons.add,
        ),
      ),
      body: ListView.builder(
          itemCount: db.toDoList.length,
          itemBuilder: (context, index) {
            return TodoTile(
              taskName: db.toDoList[index][0],
              taskCompleted: db.toDoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
              deleteFunction: (context) => deleteTask(index),
            );
          }),
    );
  }
}
