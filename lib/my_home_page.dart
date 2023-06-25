import 'package:flutter/material.dart';
import 'package:to_do/data.dart';
import 'package:to_do/cardWidget.dart';
import 'package:to_do/model.dart';
import 'package:to_do/newTaskPage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void addTodo(Model model) {
    listOfTodo.add(model);
    setState(() {});
  }

  List<Model> listOfTodo = [
    Model(
        taskName: "Task 1",
        taskDate: "23-01-2023",
        type: "Work",
        status: false),
    Model(
        taskName: "Task 2",
        taskDate: "23-01-2023",
        type: "Shopping",
        status: false),
    Model(
        taskName: "Task 3",
        taskDate: "23-01-2023",
        type: "Wishlist",
        status: true)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[300],
        title: Text("TODO: Pending"),
        actions: [
          PopupMenuButton(
              itemBuilder: (context) => popUpMenuItemTitleList
                  .map((e) => PopupMenuItem(
                        child: Text(e),
                      ))
                  .toList())
        ],
      ),
      body: ListView(
          children: listOfTodo.map((e) => CardWidget(model: e)).toList()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (child) => NewTaskPage(addTodo: addTodo),
              ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
