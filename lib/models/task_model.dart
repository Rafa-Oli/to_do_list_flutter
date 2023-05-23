class Task {
  final int id;
  final String label;
  final bool done;

  Task({required this.id, required this.label, required this.done});

  Task copyWith({
    int? id,
    String? label,
    bool? done,
  }) {
    return Task(
      id: id ?? this.id,
      label: label ?? this.label,
      done: done ?? this.done,
    );
  }
}
