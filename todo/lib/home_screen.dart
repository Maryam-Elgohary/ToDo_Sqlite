import 'package:flutter/material.dart';
import 'package:todo/floating_button.dart';
import 'package:todo/today_date.dart';
import 'package:todo/todo_list.dart';
import 'drawer_navigator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Tasker"),
          elevation: 0,
        ),
        drawer: const DrawerNavigation(),
        body: const Column(children: [TodayDate(), ToDoList()]),
        floatingActionButton: const FButton());
  }
}
