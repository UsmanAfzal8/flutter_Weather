import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  int x = 0;
  static double temp = 0.0;
  String weathercondition = '';
  static double temp1 = 0.0;
  String weathercondition1 = '';
  static double temp2 = 0.0;
  String weathercondition2 = '';
  List<double> templist = [];
  Getweather1() async {
    var api =
        'https://api.openweathermap.org/data/2.5/weather?lat=31.5204&lon=74.329376&exclude=hourly,daily&appid=c1975188522ee8a2a6d9fb75013d0958';
    var api1 =
        'https://api.openweathermap.org/data/2.5/weather?lat=48.8566&lon=2.3522&exclude=hourly,daily&appid=c1975188522ee8a2a6d9fb75013d0958';
    var api2 =
        'https://api.openweathermap.org/data/2.5/weather?lat=41.0082&lon=28.9784&exclude=hourly,daily&appid=c1975188522ee8a2a6d9fb75013d0958';
    var responce = await http.get(Uri.parse(api));
    dynamic list = jsonDecode(responce.body);
    var responce1 = await http.get(Uri.parse(api1));
    dynamic list1 = jsonDecode(responce1.body);
    var responce2 = await http.get(Uri.parse(api2));
    dynamic list2 = jsonDecode(responce2.body);
    setState(() {
      temp = list['main']['temp'] - 273.15;
      x = temp.toInt();
      temp = x as double;
      weathercondition = list['weather'][0]['main'];
      temp1 = list1['main']['temp'] - 273.15;
      x = temp1.toInt();
      temp1 = x as double;
      weathercondition1 = list1['weather'][0]['main'];
      temp2 = list2['main']['temp'] - 273.15;
      x = temp2.toInt();
      temp2 = x as double;
      weathercondition2 = list2['weather'][0]['main'];
      templist = [temp, temp1, temp2];
    });
    print(templist);
  }

  void initState() {
    super.initState();
    Getweather1();
  }

  //List<double> templist = [temp, temp1, temp2];
  getweather() {
    //print(templist);
  }

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
      body: Padding(
        padding: const EdgeInsets.only(left: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Temperature: $temp"),
            Text(" Weather Condition: $weathercondition"),
            Text("Temperature: $temp1"),
            Text(" Weather Condition: $weathercondition1"),
            Text("Temperature: $temp2"),
            Text(" Weather Condition: $weathercondition2"),
            ElevatedButton(
                onPressed: () {
                  getweather();
                },
                child: Text('pressed'))
          ],
        ),
      ),
    );
  }
}
