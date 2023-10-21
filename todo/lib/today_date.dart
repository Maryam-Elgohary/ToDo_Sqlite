import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TodayDate extends StatefulWidget {
  const TodayDate({super.key});

  @override
  State<TodayDate> createState() => _TodayDateState();
}

class _TodayDateState extends State<TodayDate> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        color: Colors.blue,
        child: ListTile(
          leading: Text("${DateFormat.d().format(DateTime.now())}",
              style: const TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          title: Text("${DateFormat.MMM().format(DateTime.now())}",
              style: const TextStyle(fontSize: 20, color: Colors.white)),
          subtitle: Text("${DateFormat.y().format(DateTime.now())}",
              style: const TextStyle(fontSize: 20, color: Colors.white)),
          trailing: Text("${DateFormat.EEEE().format(DateTime.now())}",
              style: const TextStyle(fontSize: 20, color: Colors.white)),
        ));
  }
}
