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

  updateStatus(String id, bool status) {
    int index = listOfTodo.indexWhere((element) => element.id == id);
    listOfTodo[index].status = status;
    setState(() {});
  }

  List<Model> listOfTodo = [];

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
          children: listOfTodo
              .map((e) => CardWidget(
                    model: e,
                    update: updateStatus,
                  ))
              .toList()),
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
