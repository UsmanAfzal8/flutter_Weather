import 'dart:async';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sensors_plus/sensors_plus.dart';

class Extendpage extends StatefulWidget {
  const Extendpage({
    Key? key,
    required this.foregroundImages,
    required this.backgroundImages,
    required this.texts,
    required this.templist,
    required this.weatherlist,
  }) : super(key: key);
  final List<String> foregroundImages;
  final List<String> backgroundImages;
  final List<String> texts;
  final List<String> templist;
  final List<String> weatherlist;
  @override
  State<Extendpage> createState() => _ExtendpageState();
}

class _ExtendpageState extends State<Extendpage> {
  double? _accelerometerXAxis;
  late final StreamSubscription<dynamic> _streamSubscription;

  late final List<String> _foregroundImages;
  late final List<String> _backgroundImages;
  late final List<String> _texts;
  late final List<String> _templist;
  late final List<String> _weatherlist;
  @override
  void initState() {
    super.initState();
    blablaFnc();
  }

  blablaFnc() {
    _foregroundImages = widget.foregroundImages;
    _backgroundImages = widget.backgroundImages;
    _texts = widget.texts;
    _templist = widget.templist;
    _weatherlist = widget.weatherlist;
    _streamSubscription = accelerometerEvents.listen(
      (AccelerometerEvent event) {
        setState(() {
          _accelerometerXAxis = event.x;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 520.0,
        viewportFraction: 0.80,
        enableInfiniteScroll: true,
      ),
      items: _foregroundImages.asMap().entries.map((entry) {
        int index = entry.key;
        String foregroundImage = entry.value;

        return Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 100),
                      right: _accelerometerXAxis != null
                          ? (-350 + _accelerometerXAxis! * 30)
                          : -350,
                      child: Image.asset(
                        '${_backgroundImages[index]}',
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 100),
                      width: 320,
                      height: 500,
                      bottom: -60,
                      right: _accelerometerXAxis != null
                          ? (-13 + _accelerometerXAxis! * 1.5)
                          : -13,
                      child: Image.asset(
                        '$foregroundImage',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.location_on,
                                color: Colors.white, size: 30),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              _texts[index],
                              style: const TextStyle(
                                fontFamily: 'GabrielaStencil',
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: 60,
                                  width: 100,
                                  color: Colors.transparent,
                                  child: Center(
                                    child: Text(
                                      _templist[index],
                                      style: GoogleFonts.bebasNeue(
                                          color: Colors.white,
                                          fontSize: 50,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 2),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 15,
                                  child: Text(
                                    '0',
                                    style: GoogleFonts.bebasNeue(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 2),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        Text(
                          _weatherlist[index],
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Colors.white,
                            backgroundColor:
                                const Color.fromARGB(255, 90, 86, 90),
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            letterSpacing: 1,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
