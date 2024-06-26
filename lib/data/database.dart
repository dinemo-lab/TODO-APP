import 'package:hive/hive.dart';

class Database {
  List<dynamic> toDoList = [
    // Add more tasks here
  ];

  final _myBox = Hive.box('myBox');

  void createIniateData() {
    toDoList = [
      ["Make Tutorial", false],
      ["Make Food", true],
    ];
  }

  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  void updateData() {
    _myBox.put("TODOLIST", toDoList);
  }
}
