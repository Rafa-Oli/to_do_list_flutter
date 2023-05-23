import 'package:flutter/material.dart';

import 'package:to_do_list/features/home/widgets/item_list.dart';
import 'package:to_do_list/features/home/widgets/new_task_bottom_sheet.dart';
import 'package:to_do_list/models/task_model.dart';

import '../../../services/data.dart';
import '../widgets/tab_nav_home.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TaskStatusNav statusCurrent = TaskStatusNav.ALL;
  List<Task?> listCurrent = list;

  _filterList() {
    listCurrent = statusCurrent == TaskStatusNav.ALL
        ? list
        : statusCurrent == TaskStatusNav.DONE
            ? list.where((element) => element!.done).toList()
            : list.where((element) => !(element!.done)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: const Text('To do list'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showModalBottomSheet(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              context: context,
              builder: (context) {
                return NewTaskBottomSheet(onSave: (task) {
                  setState(() {
                    list.add(Task(
                        id: list.isEmpty ? 1 : list.last!.id + 1,
                        label: task,
                        done: false));
                  });
                  Navigator.pop(context);
                });
              });
        },
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 16,
            ),
            TabNavHome(onSelect: (statusSelect) {
              setState(() {
                statusCurrent = statusSelect;
                _filterList();
              });
            }),
            const SizedBox(
              height: 24,
            ),
            if (listCurrent.isNotEmpty)
              ...listCurrent.map((e) {
                return Dismissible(
                  background: Container(
                      color: Colors.redAccent,
                      child: const Icon(
                        Icons.delete,
                        color: Colors.white,
                      )),
                  key: UniqueKey(),
                  onDismissed: (direction) {
                    setState(() {
                      list.remove(e);
                      _filterList();
                    });
                  },
                  child: ItemList(
                    task: e!,
                  ),
                );
              }),
            if (listCurrent.isEmpty) const Text('Sem tarefa cadastrada')
          ],
        ),
      ),
    );
  }
}
