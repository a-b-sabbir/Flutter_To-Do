import 'package:flutter/material.dart';
import 'package:to_do/data.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
    );
  }
}
