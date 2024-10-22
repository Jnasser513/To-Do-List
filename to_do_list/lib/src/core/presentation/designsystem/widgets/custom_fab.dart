import 'package:flutter/material.dart';

class CustomFAB extends StatelessWidget {
  final Color backgroundColor;
  final Color foregroundColor;
  final IconData iconData;
  final VoidCallback onPressed;

  const CustomFAB({
    Key? key,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.iconData,
    required this.onPressed
  }) : super(key:  key);

  @override
  Widget build(BuildContext context) {

    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      shape: const CircleBorder(),
      child: Icon(iconData),
      );
  }
  
}