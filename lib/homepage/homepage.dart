import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_weatherapp/homepage/extendpage.dart';
import 'package:http/http.dart' as http;

class frontpage extends StatefulWidget {
  const frontpage({Key? key}) : super(key: key);

  @override
  State<frontpage> createState() => _frontpageState();
}

class _frontpageState extends State<frontpage> {
  int x = 0;
  double temp = 0.0;
  String weathercondition = '';
  double temp1 = 0.0;
  String weathercondition1 = '';
  double temp2 = 0.0;
  String weathercondition2 = '';
  List<String> templist = [];
  List<String> weatherlist = [];
  bool _isLoading = false;
  Getweather1() async {
    setState(() {
      _isLoading = true;
    });
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
      templist = [temp.toString(), temp1.toString(), temp2.toString()];
      weatherlist = [weathercondition, weathercondition1, weathercondition2];
      _isLoading = false;
    });
  }

  final foregroundImages = [
    'assets/lahore1.png',
    'assets/france.png',
    'assets/turkey.png'
  ];
  final backgroundImages = [
    'assets/lahorebg.png',
    'assets/france-bg.jpg',
    'assets/turkeybg.png'
  ];
  final texts = ['Lahore', 'Paris', 'İstanbul'];
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void initState() {
    super.initState();
    Getweather1();
  }

  chalo() {
    print(templist);
    print(weatherlist);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 90, 86, 90),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            size: 30,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.person_outline,
              size: 30,
            ),
          )
        ],
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const SizedBox(height: 16),
                Center(
                  child: const Text(
                    'City Weather',
                    style: TextStyle(
                      fontFamily: 'GabrielaStencil',
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Extendpage(
                  foregroundImages: foregroundImages,
                  backgroundImages: backgroundImages,
                  texts: texts,
                  templist: templist,
                  weatherlist: weatherlist,
                ),
              ],
            ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.refresh), label: 'refresh'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), label: 'Favorite'),
        ],
        iconSize: 28,
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 90, 86, 90),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}
