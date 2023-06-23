import 'package:flutter/material.dart';
import 'package:to_do/data.dart';
import 'package:to_do/cardWidget.dart';
import 'package:to_do/model.dart';
import 'package:to_do/newTaskPage.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

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
        children: [
          CardWidget(
              model: Model(
                  taskName: "Task Name",
                  taskDate: "23-01-2023",
                  type: "Work",
                  status: false)),
          CardWidget(
              model: Model(
                  taskName: "Task Name",
                  taskDate: "23-01-2023",
                  type: "Shopping",
                  status: false)),
          CardWidget(
              model: Model(
                  taskName: "Task Name",
                  taskDate: "23-01-2023",
                  type: "Personal",
                  status: false)),
          CardWidget(
              model: Model(
                  taskName: "Task Name",
                  taskDate: "23-01-2023",
                  type: "Wishlist",
                  status: true)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NewTaskPage(),
              ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
