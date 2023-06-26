import 'package:flutter/material.dart';
import 'package:to_do/model.dart';

class CardWidget extends StatelessWidget {
  final Model model;
  final Function(String, bool) update;
  const CardWidget({super.key, required this.update, required this.model});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Checkbox(
          onChanged: (value) {
            print(value);
            update(model.id, value!);
          },
          value: model.status,
        ),
        title: Text(
          model.taskName,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          model.taskDate,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        trailing: Text(
          model.type,
          style: TextStyle(
              color: typeColor(model.type), fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

typeColor(String value) {
  switch (value) {
    case "Shopping":
      return Colors.amber;
    case "Work":
      return Colors.red;
    case "Personal":
      return Colors.blue;
    case "Wishlist":
      return Colors.green;
    default:
      return Colors.black;
  }
}
