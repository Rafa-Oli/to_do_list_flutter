import 'package:flutter/material.dart';

class NewTaskBottomSheet extends StatefulWidget {
  final Function(String) onSave;
  const NewTaskBottomSheet({super.key, required this.onSave});

  @override
  State<NewTaskBottomSheet> createState() => _NewTaskBottomSheetState();
}

class _NewTaskBottomSheetState extends State<NewTaskBottomSheet> {
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 16,
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
              const Text('Adicionar nova tarefa'),
              IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close))
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
                hintText: 'Digite o nome da tarefa',
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey))),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                  onPressed: () {
                    widget.onSave(_controller.text);
                  },
                  child: const Text('SALVAR'))),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
    ;
  }
}
