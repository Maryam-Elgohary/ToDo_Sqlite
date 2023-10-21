import 'package:flutter/material.dart';
import 'package:todo/home_screen.dart';
import 'package:todo/sql_db.dart';

class FButton extends StatefulWidget {
  const FButton({super.key});

  @override
  State<FButton> createState() => _FButtonState();
}

class _FButtonState extends State<FButton> {
  SqlDb sqlDb = SqlDb();
  TextEditingController _taskController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: () {
          setState(() {
            showModalBottomSheet(
                context: context,
                builder: (context) => Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(30))),
                    margin: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        TextField(
                            controller: _taskController,
                            decoration: InputDecoration(
                                hintText: "Enter the task", labelText: "Task")),
                        TextField(
                          controller: _dateController,
                          decoration: const InputDecoration(
                            labelText: "date",
                            prefixIcon: Icon(Icons.calendar_today),
                          ),
                          readOnly: true,
                          onTap: () {
                            _selectedDate();
                          },
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                                onPressed: () => Navigator.of(context).pop(
                                    MaterialPageRoute(
                                        builder: (context) => HomeScreen())),
                                child: const Text(
                                  "Cancel",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                )),
                            TextButton(
                                onPressed: () async {
                                  int response = await sqlDb.insertData(
                                      '''INSERT INTO todos (task, date)
                                      VALUES ("${_taskController.text}", "${_dateController.text}")
                                      
                                      ''');
                                  if (response > 0) {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                HomeScreen()));
                                  }
                                },
                                child: const Text(
                                  "Save",
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 20),
                                ))
                          ],
                        )
                      ],
                    )));
          });
        },
        child: const Icon(Icons.add));
  }

  Future<void> _selectedDate() async {
    DateTime? _picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (_picked != null) {
      setState(() {
        _dateController.text = _picked.toString().split(" ")[0];
      });
    }
  }
}
