import 'package:flutter/foundation.dart';

class TaskJson {
  final String name;
  final String description;
  final DateTime addedDate;
  final DateTime dueDate;

  const TaskJson({
    @required this.name,
    this.description,
    @required this.addedDate,
    this.dueDate,
  })  : assert(name != null),
        assert(addedDate != null);

  static TaskJson parse(Map<String, dynamic> json) {
    return TaskJson(
      name: json['name'],
      description: json['description'],
      addedDate: DateTime.parse(json['addedDate']),
      dueDate: json['dueDate'] != null ? DateTime.parse(json['dueDate']) : null,
    );
  }

  Map encode() {
    return {
      'name': name,
      'description': description,
      'addedDate': addedDate.toIso8601String(),
      'dueDate': dueDate?.toIso8601String(),
    };
  }
}