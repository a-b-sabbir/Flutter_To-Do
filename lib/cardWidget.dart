import 'package:flutter/material.dart';
import 'package:to_do/model.dart';

class CardWidget extends StatelessWidget {
  final Model model;
  const CardWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Checkbox(
          onChanged: (value) {
            print(value);
          },
          value: false,
        ),
        title: Text(model.taskName),
        subtitle: Text(
          model.taskDate,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        trailing: Text(
          model.type,
          style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
