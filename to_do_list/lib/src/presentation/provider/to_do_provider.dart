import 'package:flutter/foundation.dart';
import 'package:to_do_list/src/core/database/todo_database.dart';
import 'package:to_do_list/src/data/to_do.dart';

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

  void addNewWishList(ToDo item) {
    ToDoDatabase.db.insertTransaction(item);
    fetchTodoList();
  }

  void removeFromWishList(int id) {
    ToDoDatabase.db.deleteTransaction(id);
    fetchTodoList();
  }
}