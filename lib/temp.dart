import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class temppage extends StatefulWidget {
  const temppage({Key? key}) : super(key: key);

  @override
  State<temppage> createState() => _temppageState();
}

class _temppageState extends State<temppage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            'Weather Application',
            style: GoogleFonts.acme(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
