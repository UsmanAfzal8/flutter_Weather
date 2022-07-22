import 'package:flutter/material.dart';

class demopage extends StatefulWidget {
  const demopage({Key? key}) : super(key: key);

  @override
  State<demopage> createState() => _demopageState();
}

class _demopageState extends State<demopage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(children: [
            Container(
              height: 550,
              width: double.infinity,
              color: Colors.black,
            ),
            Container(
              height: 550,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(120),
                ),
                color: Colors.white,
              ),
            ),
          ]),
          Expanded(
            child: Stack(children: [
              Container(
                color: Colors.white,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(120),
                  ),
                  color: Colors.black,
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
