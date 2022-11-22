import 'package:flutter/material.dart';

class ForText extends StatelessWidget {
  const ForText({
    required this.name,
    this.size,
    this.bold,
    this.color,
    Key? key,
  }) : super(key: key);
  final String name;
  final double? size;
  final bool? bold;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(
        color: color ?? Colors.black,
        fontSize: size,
        fontWeight: bold == true ? FontWeight.w500 : FontWeight.w400,
      ),
    );
  }
}
