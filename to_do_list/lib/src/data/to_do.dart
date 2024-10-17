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
  })  : type = type ?? ToDoType.income, // Valor predeterminado
        date = DateTime.now().toIso8601String();

}