import 'package:flutter/material.dart';

import '../../../models/task_model.dart';
import '../../../services/data.dart';

class ItemList extends StatefulWidget {
  final Task task;

  const ItemList({super.key, required this.task});

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  late bool isSelect;

  @override
  void initState() {
    super.initState();
    setState(() {
      isSelect = widget.task.done;
    });
  }

  @override
  void didUpdateWidget(covariant ItemList oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {
      isSelect = widget.task.done;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Checkbox(
                value: isSelect,
                onChanged: (value) {
                  setState(() {
                    isSelect = value!;
                    list = list
                        .map((e) => e?.id == widget.task.id
                            ? e?.copyWith(done: value)
                            : e)
                        .toList();
                  });
                }),
            Text(widget.task.label,
                style: TextStyle(
                    decoration: isSelect ? TextDecoration.lineThrough : null)),
          ],
        ),
        const Divider()
      ],
    );
  }
}
