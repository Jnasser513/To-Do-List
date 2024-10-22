import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/src/core/presentation/designsystem/theme_provider.dart';
import 'package:to_do_list/src/presentation/pages/add_todo/add_todo_page.dart';
import 'package:to_do_list/src/presentation/pages/home/home_page.dart';
import 'package:to_do_list/src/presentation/provider/to_do_provider.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
          var toDoListProvider = ToDoProvider();
          toDoListProvider.fetchTodoList();
          return toDoListProvider;
      },
      child: MaterialApp(
        title: 'TO-DO List',
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home' : (BuildContext context) => const HomePage(),
        'add_to_do': (BuildContext context) => const AddToDoPage()
      },
      ),
    );
  }
}