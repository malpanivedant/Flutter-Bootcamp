import 'dart:async';

import 'package:flutter/material.dart';

import 'bird_category_grid_screen.dart';

class BirdingSplashScreen extends StatefulWidget {
  @override
  _BirdingSplashScreenState createState() => _BirdingSplashScreenState();
}

class _BirdingSplashScreenState extends State<BirdingSplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 13),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (BuildContext context) => BirdsCategoryScreen()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.network(
            'https://i.pinimg.com/originals/29/55/81/295581b0bf78810a2e2ea84728f8de14.gif'),
      ),
    );
  }
}
