// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../custom_widget.dart';

class CustomBarLine extends StatelessWidget {
  const CustomBarLine({
    Key? key,
    required this.title,
    required this.percentage,
  }) : super(key: key);
  final String title;
  final double percentage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: 14,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.grey,
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: 16,
                height: percentage,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        ForText(
          name: title,
          bold: true,
          size: 12,
        )
      ],
    );
  }
}
