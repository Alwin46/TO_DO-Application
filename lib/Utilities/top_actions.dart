import 'package:flutter/material.dart';

class TopActions extends StatelessWidget {
  bool checkBoxValue;
  void Function(bool?)? onChanged;
  List tasksList;

  TopActions({
    required this.checkBoxValue,
    required this.onChanged,
    required this.tasksList,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String totalCount = checkBoxValue ? tasksList.length.toString() : "0";

    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Row(
        children: [
          const SizedBox(width: 5),
          Checkbox(
            value: checkBoxValue,
            onChanged: onChanged,
            activeColor: Colors.black,
          ),
          const SizedBox(width: 5),
          const Text("Select All"),
          const SizedBox(width: 8),
          Text(totalCount),
        ],
      ),
    );
  }
}
