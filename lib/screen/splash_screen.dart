import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numerical_lotto/constant.dart';
import 'package:numerical_lotto/widget/lottie_widget.dart';

import '../home_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double imageOpacity = 0;

  @override
  void initState() {
    Future.microtask(() {
      rotaHome();
      setState(() {
        imageOpacity = 1;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Stack(
        fit: StackFit.expand,
        children: [
          buildImage(),
          buildPositionedLOTTIE(),
        ],
      ),
    );
  }

  Widget buildImage() {
    return AnimatedOpacity(
      opacity: imageOpacity,
      curve: Curves.easeInOutExpo,
      duration: Duration(seconds: 3),
      child: Image.asset(
        SPLASH_IMAGE,
      ),
    );
  }

  Widget buildPositionedLOTTIE() {
    return Positioned(
        bottom: 20,
        right: 80,
        left: 80,
        child: AnimatedOpacity(
            opacity: imageOpacity,
            duration: Duration(seconds: 10),
            child: Center(child: LottieCutomWidget(path: SPLASH_LOTTIE))));
  }

  Future<void> rotaHome() async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushReplacement(
        context, CupertinoPageRoute(builder: (context) => HomePage()));
  }
}
