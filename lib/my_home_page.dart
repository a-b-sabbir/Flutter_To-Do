import 'package:flutter/material.dart';
import 'package:to_do/data.dart';
import 'package:to_do/cardWidget.dart';

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
      body: ListView(),
    );
  }
}
