import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Color foregroundColor;
  final IconData iconData;
  final VoidCallback onPressed;

  const CustomIconButton({
    Key? key,
    required this.foregroundColor,
    required this.iconData,
    required this.onPressed
  }) : super(key:  key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        iconData,
        color: foregroundColor,
      ),
    );
  }
}