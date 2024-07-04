import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
  String taskName;
  void Function()? editButton;
  void Function()? deleteButton;
  ToDoTile({
    required this.taskName,
    required this.editButton,
    required this.deleteButton,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.green[400],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(taskName),
            Row(
              children: [
                IconButton(onPressed: editButton, icon: const Icon(Icons.edit)),
                IconButton(
                    onPressed: deleteButton, icon: const Icon(Icons.delete))
              ],
            )
          ],
        ),
      ),
    );
  }
}
