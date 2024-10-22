import 'package:to_do_list/src/data/to_do_type.dart';

class ToDo {
  final int id;
  final String title;
  final String description;
  final double amount;
  final ToDoType type;
  final String date;

  ToDo({
    required this.id,
    required this.title,
    required this.description,
    required this.amount,
    ToDoType? type,
    String? date,
  })  : type = type ?? ToDoType.income,
        date = date ?? DateTime.now().toIso8601String();

  factory ToDo.fromMap(Map<String, dynamic> map) {
    return ToDo(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      amount: map['amount'],
      type: ToDoType.values[map['type']], 
      date: map['date'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'amount': amount,
      'type': type.index,
      'date': date,
    };
  }
}
