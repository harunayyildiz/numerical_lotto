import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:numerical_lotto/constant.dart';
import 'screen/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //   statusBarColor: Colors.white,
  //   statusBarIconBrightness: Brightness.dark,
  // )); //Android
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(StartApp());
  });
}

class StartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: mainColor,
        accentColor: mainColor,
        canvasColor: mainColor,
      ),
      home: SplashScreen(),
    );
  }
}
