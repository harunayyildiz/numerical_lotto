import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //   statusBarColor: Colors.black,
  //   statusBarIconBrightness: Brightness.light,
  // ));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(SplashScreen());
  });
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
