import 'package:flutter/material.dart';

class AddDialog extends StatelessWidget {
  void Function()? addButton;
  void Function()? cancelButton;
  TextEditingController addController;

  AddDialog({
    required this.addButton,
    required this.cancelButton,
    required this.addController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        color: Colors.green[400],
        height: 200,
        width: 200,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Add new task",
                  ),
                  controller: addController,
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MaterialButton(
                      onPressed: addButton,
                      color: Colors.white,
                      child: const Text(
                        "Add",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    MaterialButton(
                      onPressed: cancelButton,
                      color: Colors.white,
                      child: const Text(
                        "Cancel",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
