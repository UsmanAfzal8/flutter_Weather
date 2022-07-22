import 'dart:async';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sensors_plus/sensors_plus.dart';

class extendpage extends StatefulWidget {
  const extendpage({
    Key? key,
    required this.foregroundImages,
    required this.backgroundImages,
    required this.texts,
    required this.templist,
  }) : super(key: key);
  final List<String> foregroundImages;
  final List<String> backgroundImages;
  final List<String> texts;
  final List<String> templist;
  @override
  State<extendpage> createState() => _extendpageState();
}

class _extendpageState extends State<extendpage> {
  double? _accelerometerXAxis;
  late final StreamSubscription<dynamic> _streamSubscription;

  late final List<String> _foregroundImages;
  late final List<String> _backgroundImages;
  late final List<String> _texts;
  late final List<String> _templist;
  @override
  void initState() {
    super.initState();
    _foregroundImages = widget.foregroundImages;
    _backgroundImages = widget.backgroundImages;
    _texts = widget.texts;
    _templist = widget.templist;
    _streamSubscription = accelerometerEvents.listen(
      (AccelerometerEvent event) {
        setState(() {
          _accelerometerXAxis = event.x;
        });
      },
    );
  }

  chalbe() {
    print(_templist);
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 520.0,
        viewportFraction: 0.80,
        enableInfiniteScroll: false,
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
                            Text(
                              _texts[index],
                              style: const TextStyle(
                                fontFamily: 'GabrielaStencil',
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'h',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            letterSpacing: 1,
                          ),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 0, primary: Colors.white30),
                          onPressed: () {
                            chalbe();
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 12.0,
                            ),
                            child: Text(
                              'EXPLORE',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                                letterSpacing: 1,
                              ),
                            ),
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
