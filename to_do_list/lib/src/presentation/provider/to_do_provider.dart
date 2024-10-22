import 'package:flutter/foundation.dart';
import 'package:to_do_list/src/core/database/todo_database.dart';
import 'package:to_do_list/src/data/to_do.dart';
import 'package:to_do_list/src/data/to_do_type.dart';

class ToDoProvider with ChangeNotifier {
  List<ToDo> todoList = [];

  int get todoListCount {
    return todoList.length;
  }

  void fetchTodoList() {
    ToDoDatabase.db.getTransactions().then((value) {
      todoList = value;
      notifyListeners();
    });
  }

  void addToDoToList(ToDo item) {
    ToDoDatabase.db.insertTransaction(item);
    fetchTodoList();
  }

  void removeToDoFromList(int id) {
    ToDoDatabase.db.deleteTransaction(id);
    fetchTodoList();
  }

  double get totalIncome {
    return todoList
        .where((todo) => todo.type == ToDoType.income && todo.amount > 0)
        .fold(0.0, (sum, todo) => sum + todo.amount);
  }

  double get totalExpenses {
    return todoList
        .where((todo) => todo.type == ToDoType.expense && todo.amount > 0)
        .fold(0.0, (sum, todo) => sum + todo.amount);
  }

  double get balance {
    return totalIncome - totalExpenses;
  }
}