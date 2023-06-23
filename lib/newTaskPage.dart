import 'package:flutter/material.dart';

class NewTaskPage extends StatefulWidget {
  const NewTaskPage({super.key});

  @override
  State<NewTaskPage> createState() => _NewTaskPageState();
}

class _NewTaskPageState extends State<NewTaskPage> {
  TextEditingController taskController = TextEditingController();
  TextEditingController dueDate = TextEditingController();
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
                    controller: dueDate,
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
                    dueDate.text = date.toString().substring(0, 10);
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
                  DropdownMenuItem(value: "Personal", child: Text('Personal'))
                ],
                onChanged: ((value) {
                  dropDownValue = value!;
                  setState(() {});
                }))
          ],
        ),
      ),
    );
  }
}
