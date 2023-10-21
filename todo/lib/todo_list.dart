import 'package:flutter/material.dart';
import 'package:todo/sql_db.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  SqlDb sqlDb = SqlDb();
  Future<List<Map>> readData() async {
    List<Map> response = await sqlDb.readData("SELECT * from todos");
    return response;
  }

  bool? _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView(
      children: [
        TextButton(
            onPressed: () async {
              await sqlDb.mydeleteDatabase();
            },
            child: const Text("Delete all tasks")),
        FutureBuilder(
            future: readData(),
            builder: (BuildContext context, AsyncSnapshot<List<Map>> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, i) {
                    return Card(
                        child: CheckboxListTile(
                      value: _isChecked,
                      onChanged: (bool? newValue) {
                        setState(() {
                          _isChecked = newValue;
                        });
                      },
                      activeColor: Colors.blue,
                      checkboxShape: const CircleBorder(),
                      controlAffinity: ListTileControlAffinity.leading,
                      title: Text("${snapshot.data![i]["task"]}"),
                      subtitle: Text("${snapshot.data![i]["date"]}"),
                    ));
                  },
                );
              }
              return const Center(child: CircularProgressIndicator());
            })
      ],
    ));
  }
}
