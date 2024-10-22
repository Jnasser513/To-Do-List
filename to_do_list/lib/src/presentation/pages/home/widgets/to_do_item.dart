import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/src/core/presentation/designsystem/app_colors.dart';
import 'package:to_do_list/src/core/presentation/designsystem/widgets/custom_icon_button.dart';
import 'package:to_do_list/src/data/to_do.dart';
import 'package:to_do_list/src/data/to_do_type.dart';
import 'package:to_do_list/src/presentation/provider/to_do_provider.dart';

class ToDoItem extends StatelessWidget {
  final ToDo item;

  const ToDoItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  Color getCardColor(ToDoType type, BuildContext context) {
    switch (type) {
      case ToDoType.income:
        return green10;
      case ToDoType.expense:
        return darkRed5;
      default:
        return gray;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: getCardColor(item.type, context),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    item.title,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.background,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                CustomIconButton(
                  foregroundColor: Theme.of(context).colorScheme.tertiary,
                  iconData: Icons.delete,
                  onPressed: () {
                    final toDoProvider = Provider.of<ToDoProvider>(context, listen: false);
                    toDoProvider.removeToDoFromList(item.id);
                  },
                ),
              ],
            ),
            Text(
              item.description,
              style: TextStyle(color: Theme.of(context).colorScheme.background),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            Text(
              'Monto: ${item.amount}',
              style: TextStyle(color: Theme.of(context).colorScheme.background),
            ),
            Text(
              'Fecha: ${item.date}',
              style: TextStyle(color: Theme.of(context).colorScheme.background),
            )
          ],
        ),
      ),
    );
  }
}
