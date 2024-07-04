import 'package:flutter/material.dart';

class EditDialog extends StatelessWidget {
  String previousValue;
  void Function()? editButton;
  void Function()? cancelButton;
  TextEditingController editController;

  EditDialog({
    required this.editButton,
    required this.cancelButton,
    required this.editController,
    required this.previousValue,
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
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: previousValue,
                  ),
                  controller: editController,
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MaterialButton(
                      onPressed: editButton,
                      color: Colors.white,
                      child: const Text(
                        "Edit",
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
