import 'package:flutter/material.dart';
import 'package:to_do/model.dart';

class NewTaskPage extends StatefulWidget {
  final Function(Model) addTodo;

  const NewTaskPage({super.key, required this.addTodo});

  @override
  State<NewTaskPage> createState() => _NewTaskPageState();
}

class _NewTaskPageState extends State<NewTaskPage> {
  TextEditingController taskController = TextEditingController();
  TextEditingController dueDateController = TextEditingController();
  String dropDownValue = "Work";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[300],
        title: Text('Add New Task'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "What is to be done?",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
            ),
            TextFormField(
              controller: taskController,
              decoration: InputDecoration(hintText: "Enter your task"),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              'Due Date',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
            ),
            Row(
              children: [
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    controller: dueDateController,
                    decoration: InputDecoration(hintText: 'Date not set'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.calendar_month),
                  onPressed: () async {
                    DateTime? date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100));
                    dueDateController.text = date.toString().substring(0, 10);
                    print(date);
                  },
                )
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              'Add to List',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
            ),
            DropdownButton(
                isExpanded: true,
                value: dropDownValue,
                items: [
                  DropdownMenuItem(value: "Work", child: Text("Work")),
                  DropdownMenuItem(value: "Personal", child: Text('Personal')),
                  DropdownMenuItem(value: "Shopping", child: Text("Shopping")),
                  DropdownMenuItem(value: "Wishlist", child: Text("Wishlist"))
                ],
                onChanged: ((value) {
                  dropDownValue = value!;
                  setState(() {});
                }))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.addTodo(
            Model(
              taskName: taskController.text,
              taskDate: dueDateController.text,
              type: dropDownValue,
              status: false,
            ),
          );
          Navigator.pop(context);
        },
        child: Icon(Icons.done),
      ),
    );
  }
}
