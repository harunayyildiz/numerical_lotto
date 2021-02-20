import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieCutomWidget extends StatelessWidget {
  final String path;
  const LottieCutomWidget({@required this.path});
  @override
  Widget build(BuildContext context) {
    return Lottie.asset('assets/images/lottie/$path.json');
  }
}
