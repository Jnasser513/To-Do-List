import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/src/core/presentation/designsystem/widgets/custom_fab.dart';
import 'package:to_do_list/src/presentation/pages/home/widgets/home_content.dart';
import 'package:to_do_list/src/presentation/provider/to_do_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    final toDoProvider = Provider.of<ToDoProvider>(context, listen: false);
    toDoProvider.fetchTodoList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<ToDoProvider>(
          builder: (context, toDoProvider, child) {
            final todoList = toDoProvider.todoList;
            if (todoList.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }
            return HomeContent(todoList: todoList);
          },
        ),
      ),
      floatingActionButton: CustomFAB(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.background,
        iconData: Icons.add,
        onPressed: () {
          Navigator.of(context).pushNamed('add_to_do');
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
