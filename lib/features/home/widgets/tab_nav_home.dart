import 'package:flutter/material.dart';

// ignore: constant_identifier_names
enum TaskStatusNav { ALL, PENDING, DONE }

class TabNavHome extends StatefulWidget {
  final Function(TaskStatusNav) onSelect;
  const TabNavHome({super.key, required this.onSelect});

  @override
  State<TabNavHome> createState() => _TabNavHomeState();
}

class _TabNavHomeState extends State<TabNavHome> {
  TaskStatusNav type = TaskStatusNav.ALL;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              type = TaskStatusNav.ALL;
            });
            widget.onSelect(type);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
            decoration: BoxDecoration(
                color: type == TaskStatusNav.ALL
                    ? Colors.lightBlueAccent
                    : Colors.grey,
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(20.0),
                  right: Radius.zero,
                )),
            child: const Text(
              'All',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              type = TaskStatusNav.PENDING;
            });
            widget.onSelect(type);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
            decoration: BoxDecoration(
                color: type == TaskStatusNav.PENDING
                    ? Colors.lightBlueAccent
                    : Colors.grey,
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.zero,
                  right: Radius.zero,
                )),
            child: const Text(
              'Pending',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              type = TaskStatusNav.DONE;
            });
            widget.onSelect(type);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
            decoration: BoxDecoration(
                color: type == TaskStatusNav.DONE
                    ? Colors.lightBlueAccent
                    : Colors.grey,
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.zero,
                  right: Radius.circular(20.0),
                )),
            child: const Text(
              'Done',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
