// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:to_doproject/utils/task_button.dart';

// ignore: must_be_immutable
class AddTask extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  AddTask(
      {super.key,
      required this.controller,
      required this.onCancel,
      required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      backgroundColor: Colors.black,
      content: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          height: 130,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 10),
                child: TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                      border: OutlineInputBorder(),
                      hintText: "Add New Task"),
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                TaskButton(text: 'Cancel', onPressed: onCancel),
                const SizedBox(
                  height: 10,
                  width: 10,
                ),
                TaskButton(text: "Save", onPressed: onSave)
              ])
            ],
          )),
    );
  }
}
